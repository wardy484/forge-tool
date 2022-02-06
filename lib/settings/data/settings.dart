import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  @HiveField(0)
  String name = "";

  @HiveField(1)
  String apiKey = "";

  bool get isConfigured {
    return name != "" && apiKey != "";
  }
}
