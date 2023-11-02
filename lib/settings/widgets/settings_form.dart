import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/servers/server_list_notifier.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/settings/widgets/settings_input.dart';
import 'package:forge/settings/widgets/settings_page_button.dart';
import 'package:forge/system_tray/app_system_tray.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_manager/window_manager.dart';

class SettingsForm extends ConsumerStatefulWidget {
  final Settings settings;
  final String? error;

  const SettingsForm({
    super.key,
    required this.settings,
    this.error,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsFormState();
}

class _SettingsFormState extends ConsumerState<SettingsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _apiKeyController = TextEditingController();
  bool _autoCleanUp = true;
  bool _launchOnStartup = true;

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
    _autoCleanUp = settings.autoCleanup;
    _launchOnStartup = settings.launchAtStartup;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Form(
          key: _formKey,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 5),
                  Text("Name:"),
                  SizedBox(height: 28),
                  Text("API Key:"),
                  SizedBox(height: 24),
                  Text("Auto-delete old rules:"),
                  SizedBox(height: 22),
                  Text("Launch on start-up:"),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: MacosSwitch(
                        value: _launchOnStartup,
                        onChanged: (value) {
                          setState(() => _launchOnStartup = value);
                        },
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: MacosSwitch(
                        value: _autoCleanUp,
                        onChanged: (value) {
                          setState(() => _autoCleanUp = value);
                        },
                      ),
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
                          _autoCleanUp,
                          _launchOnStartup,
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _validateSettings(Settings settings) async {
    final settings = ref.read(settingsNotifierProvider.notifier);

    final isValid = settings.areConfigured &&
        await ref.read(forgeSdkProvider).verifyApiKey();

    settings.apiKeyHasBeenValidated(isValid);

    if (isValid) {
      final servers = await ref.read(serverListProvider.future);

      ref.read(systemTrayProvider).addServers(servers);
      await windowManager.hide();
    }
  }
}
