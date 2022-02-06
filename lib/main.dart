import 'package:flutter/material.dart';
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

void main() async {
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
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
            },
          ),
        },
        child: MacosApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(
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
