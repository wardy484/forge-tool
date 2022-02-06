import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:forge/settings/settings_state.dart';
import 'package:hive/hive.dart';

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

class SettingsNotifier extends StateNotifier<SettingsState> {
  final Future<Box> database;

  SettingsNotifier({
    required this.database,
  }) : super(const SettingsState.initial());

  Future<void> loadSettings() async {
    var _database = await database;

    state = const SettingsState.loading();

    Settings settings = _database.get('main', defaultValue: Settings());

    _validateSettingsFields(settings);
  }

  void _validateSettingsFields(Settings settings) {
    if (settings.apiKey != "" && settings.name != "") {
      state = SettingsState.loaded(settings);
    } else {
      state = SettingsState.error(
        settings,
        "Name and API Key must be set.",
      );
    }
  }

  void apiKeyHasBeenValidated(bool isValid) {
    void handler(Settings settings) {
      if (isValid) {
        state = SettingsState.valid(settings);
      } else {
        state = SettingsState.error(
          settings,
          "Invalid API Key found, please update it and try again.",
        );
      }
    }

    state.whenOrNull(
      loaded: (settings) => handler(settings),
      valid: (settings) => handler(settings),
    );
  }

  Future<void> updateSettings(String name, String apiKey) async {
    var _database = await database;

    state = const SettingsState.loading();

    state = const SettingsState.loading();

    Settings settings = _database.get('main', defaultValue: Settings());

    settings.name = name;
    settings.apiKey = apiKey;

    _database.delete('main');
    _database.put('main', settings);

    _validateSettingsFields(settings);
  }

  bool get settingsAreConfigured {
    return state.maybeWhen(
      loaded: (settings) => settings.isConfigured,
      valid: (settings) => settings.isConfigured,
      orElse: () => false,
    );
  }
}
