import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/settings/widgets/license_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class VerifyLicensePage extends ConsumerWidget {
  const VerifyLicensePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Forge Buddy!"),
      ),
      body: ref.watch(fetchSettingsProvider).when(
            data: (settings) {
              return LicenseForm(settings: settings);
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
