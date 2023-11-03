import 'package:hive/hive.dart';

part 'quick_action.g.dart';

@HiveType(typeId: 1)
class QuickAction extends HiveObject {
  @HiveField(0)
  String name = "";

  @HiveField(1)
  List<String> ports = [];
}
