import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/exceptions/rule_exists_exception.dart';
import 'package:forge/firewall_rules/data/firewall_rule_repsitory.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/forge/model/server/server_list.dart';
import 'package:forge/firewall_rules/data/service.dart';
import 'package:forge/router.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/system_tray/system_tray_notification_manager.dart';
import 'package:system_tray/system_tray.dart';

final systemTrayProvider = Provider<AppSystemTray>((ref) {
  return AppSystemTray(
    ref: ref,
  );
});

class AppSystemTray {
  final SystemTray _systemTray;
  final AppWindow _appWindow;
  final Ref _ref;

  ServerList? serverList;

  AppSystemTray({
    required Ref ref,
  })  : _systemTray = SystemTray(),
        _appWindow = AppWindow(),
        _ref = ref,
        super();

  Future<void> init() async {
    final menu = _generateMenu(servers: [
      MenuItemLabel(
        label: "Set API Key in settings first.",
      ),
    ]);

    // We first init the systray menu and then add the menu entries
    await _systemTray.initSystemTray(
      title: "",
      iconPath: "assets/images/icon.png",
    );

    await _systemTray.setContextMenu(menu);

    // handle system tray event
    _systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == "click") {
        _systemTray.popUpContextMenu();
      }
    });
  }

  void addServers(ServerList serverList) {
    this.serverList = serverList;

    _buildMenu();
  }

  void _buildMenu() {
    if (serverList == null) {
      return;
    }

    final serverOptions = serverList!.servers.map((server) {
      return SubMenu(
        label: server.name,
        children: [
          ...Service.values.map((service) {
            return MenuItemLabel(
              label: service.label,
              onClicked: (menuItem) => _handleServerSelected(server, service),
            );
          }).toList(),
          MenuItemLabel(
            label: 'Custom',
            onClicked: (menuItem) {
              _ref
                  .read(appRouterProvider)
                  .replace(CustomFirewallRuleRoute(server: server));

              Future.delayed(const Duration(milliseconds: 100)).then((_) {
                _appWindow.show();
              });
            },
          ),
        ],
      );
    }).toList();

    _systemTray.setContextMenu(_generateMenu(servers: serverOptions));

    // handle system tray event
    _systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == "click") {
        _systemTray.popUpContextMenu();
      }
    });
  }

  Menu _generateMenu({required List<MenuItemBase> servers}) {
    final items = [
      ...servers,
      MenuSeparator(),
      MenuItemLabel(
        label: 'Settings',
        onClicked: (menuItem) {
          _ref.read(appRouterProvider).replace(SettingsRoute());

          Future.delayed(const Duration(milliseconds: 100)).then((_) {
            _appWindow.show();
          });
        },
      ),
      MenuItemLabel(
        label: 'Exit',
        onClicked: (menuItem) {
          _appWindow.close();
        },
      ),
    ];

    final menu = Menu();
    menu.buildFrom(items);

    return menu;
  }

  void _setLoadingState(Server server) {
    _systemTray.setImage("assets/images/loading-icon.gif");

    final menu = _generateMenu(servers: [
      MenuItemLabel(
        label: "Installing firewall rules on ${server.name}...",
        enabled: false,
      ),
    ]);

    _systemTray.setContextMenu(menu);
  }

  void _resetState() {
    _systemTray.setImage("assets/images/icon.png");

    _buildMenu();
  }

  Future<void> _handleServerSelected(Server server, Service service) async {
    final settings = await _ref.read(fetchSettingsProvider.future);

    try {
      _setLoadingState(server);

      await _ref.read(firewallRuleRepositoryProvider).createFirewallRules(
            serverId: server.id,
            name: settings.name,
            ports: service.ports,
          );

      // Poll to check for installation success + notify user
      // Do so in an isolate so that we don't block the main thread.
      compute(
        isolatedProgressCheck,
        ApiTokenAndServerId(apiToken: settings.apiKey, serverId: server.id),
      );

      _ref
          .read(notificationManagerProvider)
          .showFirewallRuleInstalledNotification(server);

      _resetState();
    } catch (e) {
      if (e is FirewallRuleExistsException) {
        _ref
            .read(notificationManagerProvider)
            .showDuplicateFirewallRuleNotifaction(server);

        _resetState();
      }
    }
  }
}
