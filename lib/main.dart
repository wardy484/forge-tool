import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/router.dart';
import 'package:forge/servers/server_list_notifier.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/system_tray/system_tray_notification_manager.dart';
import 'package:forge/system_tray/tray.dart';
import 'package:hive/hive.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_manager/window_manager.dart';

/// This method initializes macos_window_utils and styles the window.
Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig();
  await config.apply();
}

void main() async {
  if (!kIsWeb) {
    if (Platform.isMacOS) {
      await _configureMacosWindowUtils();
    }
  }

  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  // await hotKeyManager.unregisterAll();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(600, 280),
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );

  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(SettingsAdapter());

  final container = ProviderContainer();
  final settings = container.read(settingsNotifierProvider.notifier);

  await settings.load();

  await localNotifier.setup(
    appName: 'whitelist_ninja',
    // The parameter shortcutPolicy only works on Windows
    // shortcutPolicy: ShortcutPolicy.requireCreate,
  );

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  launchAtStartup.setup(
    appName: packageInfo.appName,
    appPath: Platform.resolvedExecutable,
  );

  if (!settings.areConfigured) {
    await launchAtStartup.enable();
  }

  container.read(notificationManagerProvider).initialise();

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    if (settings.areConfigured) {
      // TODO: Clean up
      // This is still kinda ugly, maybe on first launch, show a loading screen
      // add in an artifical delay so they can see _something_ then hide everything.
      await windowManager.hide();
    } else {
      await windowManager.show();
      await windowManager.focus();
    }
  });

  final hasValidKey = settings.areConfigured &&
      await container.read(forgeSdkProvider).verifyApiKey();

  settings.apiKeyHasBeenValidated(hasValidKey);

  final servers = await container.read(serverListProvider.future);
  final systemTray = container.read(systemTrayProvider);

  await systemTray.init();
  systemTray.addServers(servers);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

final _appRouter = AppRouter();

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CloseShortcut(
      child: MacosApp.router(
        theme: MacosThemeData.light(),
        darkTheme: MacosThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
      ),
    );
  }
}

final hideWindowKeySet = LogicalKeySet(
  LogicalKeyboardKey.meta, // Replace with control on Windows
  LogicalKeyboardKey.keyW,
);

class HideWindowIntent extends Intent {}

class CloseShortcut extends ConsumerWidget {
  const CloseShortcut({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FocusableActionDetector(
      autofocus: true,
      shortcuts: {
        hideWindowKeySet: HideWindowIntent(),
      },
      actions: {
        HideWindowIntent: CallbackAction(onInvoke: (e) {
          windowManager.hide();
          return null;
        }),
      },
      child: child,
    );
  }
}
