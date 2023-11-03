import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forge/quick_actions/data/quick_action_repository.dart';
import 'package:forge/router.dart';
import 'package:forge/system_tray/app_system_tray.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class QuickActionsListPage extends ConsumerWidget {
  const QuickActionsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Row(
          children: [
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(width: 8),
            const Text("Quick Actions"),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              ref.read(appRouterProvider).push(CreateQuickActionRoute());
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ref.watch(quickActionsProvider).when(
            data: (quickActions) {
              return ListView.separated(
                itemCount: quickActions.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final quickAction = quickActions[index];

                  return ListTile(
                    title: Text(quickAction.name),
                    subtitle: Text(quickAction.ports.join(", ")),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await ref
                            .read(quickActionsProvider.notifier)
                            .removeQuickAction(quickAction);

                        ref.read(systemTrayProvider).rebuild();
                      },
                    ),
                  );
                },
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
          ),
    );
  }
}
