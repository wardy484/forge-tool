import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/settings/widgets/settings_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ref.watch(settingsProvider).when(
            data: (settings) {
              return SettingsForm(settings: settings);
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
