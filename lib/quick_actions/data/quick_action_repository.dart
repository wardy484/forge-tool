import 'package:forge/firewall_rules/data/service.dart';
import 'package:forge/quick_actions/data/quick_action.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quick_action_repository.g.dart';

final quickActionsDatabaseProvider = Provider((ref) {
  return Hive.openBox<QuickAction>("quick_actions");
});

@Riverpod(keepAlive: true)
class QuickActions extends _$QuickActions {
  @override
  Future<List<QuickAction>> build() async {
    final db = await ref.read(quickActionsDatabaseProvider);

    return db.values.toList();
  }

  Future<void> addQuickAction(String name, List<String> ports) async {
    final db = await ref.read(quickActionsDatabaseProvider);

    var quickAction = QuickAction()
      ..name = name
      ..ports = ports;

    await db.add(quickAction);

    state = AsyncData(db.values.toList());
  }

  Future<void> removeQuickAction(QuickAction quickAction) async {
    final db = await ref.read(quickActionsDatabaseProvider);

    await db.delete(quickAction.key);

    state = AsyncData(db.values.toList());
  }

  Future<void> createDefaultQuickActions() async {
    final defaults = Service.values.toList();
    final db = await ref.read(quickActionsDatabaseProvider);

    if (db.values.isNotEmpty) return;

    final List<QuickAction> quickActions = [];

    for (var defaultQuickAction in defaults) {
      var quickAction = QuickAction()
        ..name = defaultQuickAction.label
        ..ports = defaultQuickAction.ports;

      quickActions.add(quickAction);
    }

    await db.addAll(quickActions);

    state = AsyncData(db.values.toList());
  }

  Future<void> reset() async {
    var db = await ref.read(quickActionsDatabaseProvider);

    await db.clear();

    state = AsyncData(db.values.toList());
  }
}
