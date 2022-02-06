import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/forge/model/server/server_list.dart';
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
    // Only valid on MacOS
    String path = 'AppIcon';

    final menu = _generateMenu(servers: [
      MenuItem(
        label: "Set API Key in settings first.",
      ),
    ]);

    // We first init the systray menu and then add the menu entries
    await _systemTray.initSystemTray(
      title: "",
      iconPath: path,
    );

    await _systemTray.setContextMenu(menu);

    // handle system tray event
    _systemTray.registerSystemTrayEventHandler((eventName) {
      print("eventName: $eventName");

      if (eventName == "leftMouseDown") {
        // do nothing apparently
      } else if (eventName == "leftMouseUp") {
        _systemTray.popUpContextMenu();
      } else if (eventName == "rightMouseDown") {
      } else if (eventName == "rightMouseUp") {
        _appWindow.show();
      }
    });
  }

  void addServers(ServerList serverList, Function(Server server) callback) {
    final serverOptions = serverList.servers.map((server) {
      return MenuItem(
          label: server.name,
          onClicked: () {
            _appWindow.show();

            callback(server);
          });
    }).toList();

    _systemTray.setContextMenu(_generateMenu(servers: serverOptions));
  }

  List<MenuItemBase> _generateMenu({required List<MenuItem> servers}) {
    return [
      SubMenu(
        label: "Servers",
        children: servers,
      ),
      MenuSeparator(),
      MenuItem(
        label: 'Show',
        onClicked: () {
          _appWindow.show();
        },
      ),
      MenuItem(
        label: 'Exit',
        onClicked: () {
          _appWindow.close();
        },
      ),
    ];
  }

  void hideWindow() {
    _appWindow.hide();
  }
}
