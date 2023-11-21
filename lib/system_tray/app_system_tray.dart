import 'package:auto_updater/auto_updater.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/common/exceptions/rule_exists_exception.dart';
import 'package:forge/firewall_rules/data/firewall_rule_repsitory.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/forge/model/server/server_list.dart';
import 'package:forge/forge/model/site/site.dart';
import 'package:forge/quick_actions/data/quick_action_repository.dart';
import 'package:forge/router.dart';
import 'package:forge/servers/server_list_notifier.dart';
import 'package:forge/servers/site_list.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/system_tray/system_tray_notification_manager.dart';
import 'package:process_run/process_run.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

const MenuBarIconPath = "assets/images/menu-bar-icon.svg";
const MenuBarLoadingIconPath = "assets/images/loading-icon.gif";

final systemTrayProvider = Provider<AppSystemTray>((ref) {
  return AppSystemTray(
    ref: ref,
  );
});

class AppSystemTray {
  final SystemTray _systemTray;
  final AppWindow _appWindow;
  final Ref ref;

  ServerList? serverList;

  AppSystemTray({
    required Ref this.ref,
  })  : _systemTray = SystemTray(),
        _appWindow = AppWindow(),
        super();

  Future<void> init() async {
    await _systemTray.initSystemTray(
      title: "",
      iconPath: MenuBarIconPath,
      isTemplate: true,
    );

    _systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == "click") {
        _systemTray.popUpContextMenu();
      }
    });
  }

  void buildLoadingMenu() {
    _setMenuItems(
      icon: MenuBarLoadingIconPath,
      children: [
        MenuItemLabel(
          label: 'Fetching server list...',
          enabled: false,
        ),
      ],
    );
  }

  void buildConfigurationRequiredMenu() {
    _setMenuItems(children: [
      MenuItemLabel(
        label: 'Update settings to continue.',
        enabled: false,
      ),
    ]);
  }

  void buildAddingRuleMenu() {
    _setMenuItems(
      icon: MenuBarLoadingIconPath,
      children: [
        MenuItemLabel(
          label: 'Adding firewall rule...',
          enabled: false,
        ),
      ],
    );
  }

  void buildPendingLicenseMenu() {
    _setMenuItems(
      includeSettings: false,
      includeUpdates: false,
      children: [
        MenuItemLabel(
          label: 'Enter license key or continue free trial.',
          onClicked: (_) {
            ref.read(appRouterProvider).replace(VerifyLicenseRoute());

            Future.delayed(const Duration(milliseconds: 100)).then((_) {
              windowManager.show();
              windowManager.focus();
            });
          },
        ),
      ],
    );
  }

  Future<void> buildLoadedMenu() async {
    buildLoadingMenu();

    final quickActions = await ref.read(quickActionsProvider.future);
    final serverList = await ref.read(serverListProvider.future);

    final serverMenuItems = serverList.servers.map((server) async {
      final sites = await ref.read(siteListsProvider(server.id).future);

      return SubMenu(
        label: server.name,
        children: [
          ...sites.sites.map((site) {
            return SubMenu(
              label: site.name,
              children: [
                MenuItemLabel(
                  label: "Visit site",
                  onClicked: (_) async {
                    return runShellCommand(
                      "open 'https://${site.name}'",
                    );
                  },
                ),
                MenuItemLabel(
                    label: "Deploy",
                    onClicked: (_) async =>
                        await _onDeployClicked(server, site)),
                MenuItemLabel(
                  label: "Edit .env",
                  onClicked: (_) async => await _onEditEnvClicked(server, site),
                ),
              ],
            );
          }).toList(),
          MenuSeparator(),
          SubMenu(
            label: 'Whitelist',
            children: [
              ...quickActions.map((action) {
                return MenuItemLabel(
                  label: action.name,
                  onClicked: (_) => _onQuickActionClicked(server, action.ports),
                );
              }).toList(),
              MenuSeparator(),
              MenuItemLabel(
                label: 'Add custom firewall rule',
                onClicked: (_) => _onAddCustomFirewallRuleClicked(server),
              ),
            ],
          ),
          MenuItemLabel(
            label: 'Connect via SSH',
            onClicked: (_) async => await _onConnectViaSshClicked(server),
          ),
          MenuItemLabel(
            label: 'Open in Forge',
            onClicked: (_) async => await _onOpenInForgeClicked(server),
          ),
        ],
      );
    }).toList();

    _setMenuItems(
      children: [
        ...await Future.wait(serverMenuItems),
      ],
    );
  }

  void _setMenuItems({
    bool includeSettings = true,
    bool includeUpdates = true,
    String icon = MenuBarIconPath,
    required List<MenuItemBase> children,
  }) {
    _systemTray.setImage(icon, isTemplate: true);

    final items = [
      ...children,
      MenuSeparator(),
      if (includeSettings)
        MenuItemLabel(
          label: 'Settings',
          onClicked: (_) => _onSettingsClicked(),
        ),
      if (includeUpdates)
        MenuItemLabel(
          label: 'Check for updates',
          onClicked: (_) => _onCheckForUpdatesClicked,
        ),
      MenuItemLabel(
        label: 'Exit',
        onClicked: (_) => _onExitClicked(),
      ),
    ];

    final menu = Menu()..buildFrom(items);

    _systemTray.setContextMenu(menu);
  }

  void _onExitClicked() {
    SystemNavigator.pop();
  }

  void _onCheckForUpdatesClicked() {
    autoUpdater.checkForUpdates(inBackground: false);
  }

  void _onSettingsClicked() {
    ref.read(appRouterProvider).replace(SettingsRoute());

    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      _appWindow.show();
    });
  }

  void _onAddCustomFirewallRuleClicked(Server server) {
    ref
        .read(appRouterProvider)
        .replace(CustomFirewallRuleRoute(server: server));

    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      _appWindow.show();
    });
  }

  Future<void> _onConnectViaSshClicked(Server server) async {
    return runShellCommand(
      "open 'ssh://forge@${server.ipAddress}'",
    );
  }

  Future<void> _onOpenInForgeClicked(Server server) async {
    return runShellCommand(
      "open 'https://forge.laravel.com/servers/${server.id}/sites'",
    );
  }

  Future<void> _onEditEnvClicked(Server server, Site site) async {
    return runShellCommand(
      "open 'https://forge.laravel.com/servers/${server.id}/sites/${site.id}/environment'",
    );
  }

  Future<void> runShellCommand(String command) async {
    var shell = Shell();

    try {
      await shell.run(command);
    } catch (e) {
      ref.read(notificationManagerProvider).showUnableToOpenBrowserError();
    }
  }

  Future<void> _onDeployClicked(Server server, Site site) async {
    await ref.read(forgeSdkProvider).deploy(server.id, site.id);
  }

  Future<void> _onQuickActionClicked(Server server, List<String> ports) async {
    final settings = await ref.read(settingsProvider.future);

    try {
      buildAddingRuleMenu();

      await ref.read(firewallRuleRepositoryProvider).createFirewallRules(
            serverId: server.id,
            name: settings.name,
            ports: ports,
          );

      // Poll to check for installation success + notify user
      // Do so in an isolate so that we don't block the main thread.
      compute(
        isolatedProgressCheck,
        ApiTokenAndServerId(apiToken: settings.apiKey, serverId: server.id),
      );

      ref
          .read(notificationManagerProvider)
          .showFirewallRuleInstalledNotification(server);
    } catch (e) {
      if (e is FirewallRuleExistsException) {
        ref
            .read(notificationManagerProvider)
            .showDuplicateFirewallRuleNotifaction(server);
      }
    } finally {
      buildLoadedMenu();
    }
  }
}
