import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 0)
class SettingsModel extends HiveObject {
  @HiveField(0)
  String name = "";

  @HiveField(1)
  String apiKey = "";

  @HiveField(2, defaultValue: true)
  bool autoCleanup = true;

  @HiveField(3, defaultValue: true)
  bool launchAtStartup = true;

  bool get isConfigured {
    return name != "" && apiKey != "";
  }
}
