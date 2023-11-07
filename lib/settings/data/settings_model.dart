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

  @HiveField(4, defaultValue: "")
  String licenseKey = "";

  @HiveField(6, defaultValue: "")
  String email = "";

  @HiveField(7, defaultValue: false)
  bool hasValidLicense = false;

  @HiveField(8)
  DateTime? dateVerified = DateTime.now();

  @HiveField(9)
  DateTime? firstLaunched = DateTime.now();

  bool get isConfigured {
    return name != "" && apiKey != "";
  }

  int get remainingTrial {
    final now = DateTime.now();
    // if (firstLaunched == null) return 0;
    final difference = now.difference(firstLaunched!);
    final days = difference.inDays;
    final remaining = 7 - days;
    return remaining;
  }
}
