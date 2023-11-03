import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forge/forge/forge.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

class SettingsForm extends HookConsumerWidget {
  const SettingsForm({
    super.key,
    required this.settings,
  });

  final Settings settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final nameController = useTextEditingController(text: settings.name);
    final apiKeyController = useTextEditingController(text: settings.apiKey);
    final autoCleanUp = useState(settings.autoCleanup);
    final launchOnStartup = useState(settings.launchAtStartup);
    final apiKeyMessage = useState<String?>(null);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Form(
        key: formKey.value,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "Enter your name",
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a name";
                }

                return null;
              },
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: apiKeyController,
              decoration: const InputDecoration(
                labelText: "API Key",
                hintText: "Enter your API key",
                prefixIcon: Icon(Icons.key),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter an API key";
                }

                return null;
              },
            ),
            if (apiKeyMessage.value != null)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      apiKeyMessage.value!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 8),
            CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 3),
              value: autoCleanUp.value,
              title: const Text("Auto-delete old rules"),
              subtitle: const Text(
                "Automatically clean up old firewall rules after your IP Address changes.",
              ),
              onChanged: (value) => autoCleanUp.value = value ?? false,
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 3),
              value: launchOnStartup.value,
              title: const Text("Launch on start-up"),
              subtitle: const Text(
                "Launch Forge on start-up.",
                style: TextStyle(),
              ),
              onChanged: (value) => launchOnStartup.value = value ?? false,
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text("Save"),
                    onPressed: () => _handleSave(
                      ref,
                      formKey.value,
                      nameController.text,
                      apiKeyController.text,
                      autoCleanUp.value,
                      launchOnStartup.value,
                      apiKeyMessage,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSave(
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    String name,
    String apiKey,
    bool autoCleanUp,
    bool launchOnStartup,
    ValueNotifier<String?> apiKeyMessage,
  ) async {
    if (formKey.currentState!.validate() == false) return;

    final apiKeyIsValid = await ref.read(forgeSdkProvider).verifyApiKey(apiKey);

    if (!apiKeyIsValid) {
      apiKeyMessage.value = "Invalid API Key.";
      return;
    }

    apiKeyMessage.value = null;

    final settingsNotifier = ref.read(settingsNotifierProvider.notifier);

    await settingsNotifier.updateSettings(
      name,
      apiKey,
      autoCleanUp,
      launchOnStartup,
    );

    windowManager.hide();
  }
}
