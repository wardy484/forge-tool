import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:forge/settings/settings_state.dart';
import 'package:hive/hive.dart';
import 'package:launch_at_startup/launch_at_startup.dart' as startup;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_notifier.g.dart';

final settingsDatabaseProvider = Provider((ref) {
  return Hive.openBox<Settings>("settings");
});

final settingsNotifierProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) {
    return SettingsNotifier(
      database: ref.watch(settingsDatabaseProvider),
    );
  },
);

@Riverpod(keepAlive: true)
Future<Settings> fetchSettings(Ref ref) async {
  final db = await ref.read(settingsDatabaseProvider);
  return db.get('main', defaultValue: Settings()) as Settings;
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  final Future<Box> database;

  SettingsNotifier({
    required this.database,
  }) : super(const SettingsState.initial());

  // TODO: Could just be a future proivide really
  Future<void> updateSettings(
    String name,
    String apiKey,
    bool autoCleanup,
    bool launchAtStartup,
  ) async {
    var settingsDB = await database;

    // WTF is this... i should really re-write this garbage
    state = const SettingsState.loading();

    state = const SettingsState.loading();

    Settings settings = settingsDB.get('main', defaultValue: Settings());

    settings.name = name;
    settings.apiKey = apiKey;
    settings.autoCleanup = autoCleanup;
    settings.launchAtStartup = launchAtStartup;

    if (launchAtStartup) {
      await startup.launchAtStartup.enable();
    } else {
      await startup.launchAtStartup.disable();
    }

    settingsDB.delete('main');
    settingsDB.put('main', settings);
  }
}
