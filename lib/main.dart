import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/quick_actions/data/quick_action.dart';
import 'package:forge/router.dart';
import 'package:forge/servers/server_list_notifier.dart';
import 'package:forge/settings/data/settings_model.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/system_tray/system_tray_notification_manager.dart';
import 'package:forge/system_tray/app_system_tray.dart';
import 'package:hive/hive.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:yaru/yaru.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(600, 420),
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );

  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(SettingsModelAdapter());
  Hive.registerAdapter(QuickActionAdapter());

  final container = ProviderContainer();

  final settings = await container.read(fetchSettingsProvider.future);
  container.read(notificationManagerProvider).initialise();

  final systemTray = container.read(systemTrayProvider);
  await systemTray.init();

  await localNotifier.setup(
    appName: 'whitelist_ninja',
  );

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  launchAtStartup.setup(
    appName: packageInfo.appName,
    appPath: Platform.resolvedExecutable,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    final apiKeyIsValid = settings.isConfigured &&
        await container.read(forgeSdkProvider).verifyApiKey(settings.apiKey);

    if (apiKeyIsValid) {
      await windowManager.hide();

      final servers = await container.read(serverListProvider.future);
      systemTray.addServers(servers);
    } else {
      await launchAtStartup.enable();
      await windowManager.show();
      await windowManager.focus();
    }
  });

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://ddb83c056f27d0349e716d89241f39eb@o1207946.ingest.sentry.io/4506152044068864';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () {
      return runApp(
        UncontrolledProviderScope(
          container: container,
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final _appRouter = ref.watch(appRouterProvider);

    return CloseShortcut(
      child: YaruTheme(
        builder: (context, yaru, child) {
          return MaterialApp.router(
            theme: yaru.theme,
            darkTheme: yaru.darkTheme,
            debugShowCheckedModeBanner: false,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
          );
        },
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
