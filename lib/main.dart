import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/router.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/system_tray/tray.dart';
import 'package:hive/hive.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:path_provider/path_provider.dart';

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

  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(SettingsAdapter());

  final container = ProviderContainer();
  final settingsNotifier = container.read(settingsNotifierProvider.notifier);

  await settingsNotifier.loadSettings();

  final hasValidKey = settingsNotifier.settingsAreConfigured &&
      await verifyApiKey(container.read(forgeSdkProvider));

  settingsNotifier.apiKeyHasBeenValidated(hasValidKey);

  final systemTray = container.read(systemTrayProvider);
  await systemTray.init();

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
    final settingsState = ref.read(settingsNotifierProvider);

    // TOOD: Handle CMD + Q, the below code does not work :sad_face:
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(
          LogicalKeyboardKey.superKey,
          LogicalKeyboardKey.keyQ,
        ): HideIntent(),
        // LogicalKeySet(LogicalKeyboardKey.keyQ): AddIntent(),
      },
      child: Actions(
        actions: {
          HideIntent: CallbackAction<HideIntent>(
            onInvoke: (intent) {
              ref.read(systemTrayProvider).hideWindow();
              return null;
            },
          ),
        },
        child: MacosApp.router(
          theme: MacosThemeData.light(),
          darkTheme: MacosThemeData.dark(),
          // themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(
            // TODO: Default route;
            initialRoutes: settingsState.whenOrNull(
              valid: (settings) => [
                const ServerListRoute(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HideIntent extends Intent {}
