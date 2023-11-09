import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forge/forge_buddy_api/verify_license.dart';
import 'package:forge/router.dart';
import 'package:forge/settings/data/settings_model.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:forge/system_tray/app_system_tray.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

class LicenseForm extends HookConsumerWidget {
  const LicenseForm({
    super.key,
    required this.settings,
  });

  final SettingsModel settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final licenseKeyController = useTextEditingController(
      text: settings.licenseKey,
    );
    final emailController = useTextEditingController(text: settings.email);
    final errorMessage = useState<String?>(null);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Form(
        key: formKey.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter your email address",
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email address.";
                }

                if (!EmailValidator.validate(value)) {
                  return "Please enter a valid email address.";
                }

                return null;
              },
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: licenseKeyController,
              decoration: const InputDecoration(
                labelText: "License Key",
                hintText: "Enter your license key",
                prefixIcon: Icon(Icons.key),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a valid license key.";
                }

                return null;
              },
            ),
            if (errorMessage.value != null)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      errorMessage.value!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 12),
            Text("Remaining Trial: ${settings.remainingTrial} days"),
            SizedBox(height: 12),
            Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  if (settings.remainingTrial > 0)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: OutlinedButton(
                          child: Text(
                              "Continue Trial: ${settings.remainingTrial} days"),
                          onPressed: () {
                            final systemTray = ref.read(systemTrayProvider);

                            if (settings.isConfigured) {
                              systemTray.buildLoadedMenu();
                              windowManager.hide();
                            } else {
                              ref
                                  .read(appRouterProvider)
                                  .replace(const SettingsRoute());

                              systemTray.buildConfigurationRequiredMenu();
                            }
                          },
                        ),
                      ),
                    ),
                  Expanded(
                    child: OutlinedButton(
                      child: Text("Purchase License"),
                      onPressed: () async {
                        final purchaseUri = Uri.parse(
                          'https://forgebuddy.com/checkout',
                        );

                        await launchUrl(purchaseUri);
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Activate License"),
                      onPressed: () => _handleSave(
                        ref,
                        formKey.value,
                        licenseKeyController.text,
                        emailController.text,
                        errorMessage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSave(
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    String licenseKey,
    String email,
    ValueNotifier<String?> errorMessage,
  ) async {
    if (formKey.currentState!.validate() == false) return;

    final licenseIsValid = await ref.read(verifyLicenseProvider(
      licenseKey,
      email,
    ).future);

    if (!licenseIsValid) {
      errorMessage.value = "Invalid license key or email address.";
      return;
    }

    errorMessage.value = null;

    await ref.read(settingsProvider.notifier).updateLicense(licenseKey, email);

    if (settings.isConfigured) {
      await windowManager.hide();
    } else {
      ref.read(appRouterProvider).replace(const SettingsRoute());
    }
  }
}
