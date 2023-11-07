import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/settings/data/settings_model.dart';
import 'package:hive/hive.dart';
import 'package:launch_at_startup/launch_at_startup.dart' as startup;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_notifier.g.dart';

final settingsDatabaseProvider = Provider((ref) {
  return Hive.openBox<SettingsModel>("settings");
});

@Riverpod(keepAlive: true)
Future<SettingsModel> fetchSettings(Ref ref) async {
  final db = await ref.read(settingsDatabaseProvider);
  return db.get('main', defaultValue: SettingsModel()) as SettingsModel;
}

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  FutureOr<SettingsModel> build() async {
    final db = await ref.read(settingsDatabaseProvider);
    return db.get('main', defaultValue: SettingsModel()) as SettingsModel;
  }

  Future<void> updateSettings(
    String name,
    String apiKey,
    bool autoCleanup,
    bool launchAtStartup,
  ) async {
    var db = await ref.read(settingsDatabaseProvider);

    SettingsModel settings =
        db.get('main', defaultValue: SettingsModel()) as SettingsModel;

    settings.name = name;
    settings.apiKey = apiKey;
    settings.autoCleanup = autoCleanup;
    settings.launchAtStartup = launchAtStartup;

    if (launchAtStartup) {
      await startup.launchAtStartup.enable();
    } else {
      await startup.launchAtStartup.disable();
    }

    db.delete('main');
    db.put('main', settings);
  }

  Future<void> reset() async {
    var db = await ref.read(settingsDatabaseProvider);

    SettingsModel settings =
        db.get('main', defaultValue: SettingsModel()) as SettingsModel;

    settings.name = "";
    settings.apiKey = "";
    settings.autoCleanup = true;
    settings.launchAtStartup = true;

    db.delete('main');
    db.put('main', settings);
  }
}
