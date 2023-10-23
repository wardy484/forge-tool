import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/forge/model/server/server_list.dart';
import 'package:forge/whitelist/pages/whitelist_page.dart';
import 'package:system_tray/system_tray.dart';

final systemTrayProvider = Provider<ForgeSystemTray>((ref) {
  return ForgeSystemTray();
});

class ForgeSystemTray {
  final SystemTray _systemTray;
  final AppWindow _appWindow;

  ForgeSystemTray()
      : _systemTray = SystemTray(),
        _appWindow = AppWindow(),
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

  void addServers(
    ServerList serverList,
    Function(Server, {WhitelistPort? port}) callback,
  ) {
    final serverOptions = serverList.servers.map((server) {
      return SubMenu(label: server.name, children: [
        MenuItemLabel(
          label: "HTTP",
          onClicked: (menuItem) {
            _appWindow.show();

            callback(server, port: WhitelistPort.http);
          },
        ),
        MenuItemLabel(
          label: "MySQL",
          onClicked: (menuItem) {
            _appWindow.show();

            callback(server, port: WhitelistPort.mysql);
          },
        ),
        MenuItemLabel(
          label: "SSH",
          onClicked: (menuItem) {
            _appWindow.show();

            callback(server, port: WhitelistPort.ssh);
          },
        ),
        MenuItemLabel(
          label: "Open",
          onClicked: (menuItem) {
            _appWindow.show();

            callback(server);
          },
        ),
      ]);
    }).toList();

    _systemTray.setContextMenu(_generateMenu(servers: serverOptions));
  }

  Menu _generateMenu({required List<MenuItemBase> servers}) {
    final items = [
      SubMenu(
        label: "Servers",
        children: servers,
      ),
      MenuSeparator(),
      MenuItemLabel(
        label: 'Show',
        onClicked: (menuItem) {
          _appWindow.show();
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

  void hideWindow() {
    _appWindow.hide();
  }
}
