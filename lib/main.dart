import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/forge_buddy_app.dart';
import 'package:forge/quick_actions/data/quick_action.dart';
import 'package:forge/quick_actions/data/quick_action_repository.dart';
import 'package:forge/settings/data/settings_model.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/system_tray/system_tray_notification_manager.dart';
import 'package:forge/system_tray/app_system_tray.dart';
import 'package:hive/hive.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:auto_updater/auto_updater.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(600, 420),
    minimumSize: Size(600, 420),
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );

  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(SettingsModelAdapter());
  Hive.registerAdapter(QuickActionAdapter());

  final container = ProviderContainer();

  final settings = await container.read(settingsProvider.future);
  await container.read(notificationManagerProvider).initialise();

  final systemTray = container.read(systemTrayProvider);
  await systemTray.init();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  launchAtStartup.setup(
    appName: packageInfo.appName,
    appPath: Platform.resolvedExecutable,
  );

  // Uncomment to run as a "new user" for testing
  // await container.read(settingsProvider.notifier).reset();
  // await container.read(quickActionsProvider.notifier).reset();
  // await container.read(settingsProvider.future);

  await container
      .read(quickActionsProvider.notifier)
      .createDefaultQuickActions();

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    final apiKeyIsValid = settings.isConfigured &&
        await container.read(forgeSdkProvider).verifyApiKey(settings.apiKey);

    if (apiKeyIsValid && settings.hasValidLicense) {
      await windowManager.hide();
      await systemTray.buildLoadedMenu();

      await configureAutoUpdater();
    } else {
      if (!settings.hasValidLicense) {
        systemTray.buildPendingLicenseMenu();
      } else {
        await systemTray.buildLoadedMenu();
        await configureAutoUpdater();
      }

      if (launchAtStartup.isEnabled == true) {
        await launchAtStartup.enable();
      }

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
          child: const ForgeBuddyApp(),
        ),
      );
    },
  );
}

Future<void> configureAutoUpdater() async {
  String feedURL = 'http://localhost:5002/appcast.xml';
  await autoUpdater.setFeedURL(feedURL);
  await autoUpdater.checkForUpdates();
  await autoUpdater.setScheduledCheckInterval(3600);
}
