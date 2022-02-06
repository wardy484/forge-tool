import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/router.dart';
import 'package:forge/servers/server_list_notifier.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/settings/widgets/settings_input.dart';
import 'package:forge/settings/widgets/settings_page_button.dart';

class SettingsForm extends ConsumerStatefulWidget {
  final Settings settings;
  final String? error;

  const SettingsForm({
    Key? key,
    required this.settings,
    this.error,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsFormState();
}

class _SettingsFormState extends ConsumerState<SettingsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _apiKeyController = TextEditingController();

  @override
  void initState() {
    ref.read(settingsNotifierProvider).whenOrNull(
          loaded: (settings) => _assignControllers(settings),
          valid: (settings) => _assignControllers(settings),
          error: (settings, _) => _assignControllers(settings),
        );

    super.initState();
  }

  void _assignControllers(Settings settings) {
    _nameController.text = settings.name;
    _apiKeyController.text = settings.apiKey;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            if (widget.error is String)
              Card(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16,
                  ),
                  child: Text(
                    widget.error ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (widget.error is String) const SizedBox(height: 14),
            SettingsInput(
              icon: CupertinoIcons.person,
              placeholder: 'Enter your name',
              controller: _nameController,
            ),
            const SizedBox(height: 14),
            SettingsInput(
              icon: CupertinoIcons.lock,
              placeholder: 'Enter your api key',
              controller: _apiKeyController,
            ),
            const SizedBox(height: 14),
            SettingsPageButton(
              label: "Save",
              onPressed: () async {
                final settingsNotifier =
                    ref.read(settingsNotifierProvider.notifier);

                await settingsNotifier.updateSettings(
                  _nameController.text,
                  _apiKeyController.text,
                );

                ref.read(settingsNotifierProvider).maybeWhen(
                      valid: (settings) => _validateSettings(settings),
                      loaded: (settings) => _validateSettings(settings),
                      orElse: () {},
                    );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _validateSettings(Settings settings) async {
    final settingsNotifier = ref.read(settingsNotifierProvider.notifier);

    final isValid = settingsNotifier.settingsAreConfigured &&
        await verifyApiKey(ref.read(forgeSdkProvider));

    settingsNotifier.apiKeyHasBeenValidated(isValid);

    if (isValid) {
      ref.read(serverListNotifierProvider.notifier).getServerList();

      AutoRouter.of(context).popUntilRoot();
      AutoRouter.of(context).replace(const ServerListRoute());
    }
  }
}
