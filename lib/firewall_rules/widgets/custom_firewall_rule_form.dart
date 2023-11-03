import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forge/common/exceptions/rule_exists_exception.dart';
import 'package:forge/common/widgets/bottom_full_width_button.dart';
import 'package:forge/common/widgets/ports_form.dart';
import 'package:forge/firewall_rules/data/firewall_rule_repsitory.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:forge/system_tray/system_tray_notification_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

class CustomFirewallRuleForm extends HookConsumerWidget {
  const CustomFirewallRuleForm({
    super.key,
    required this.server,
    required this.defaultIpAddress,
    required this.settings,
  });

  final Server server;
  final String defaultIpAddress;
  final Settings settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final nameController = useTextEditingController(text: settings.name);
    final ipAddress = useTextEditingController(text: defaultIpAddress);
    final ports = useState(<String>[]);
    final installing = useState(false);
    final errorMessage = useState<String?>(null);

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
              controller: ipAddress,
              decoration: const InputDecoration(
                labelText: "IP Address",
                hintText: "Enter your IP address",
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter an IP address";
                }

                return null;
              },
            ),
            SizedBox(height: 12),
            PortsForm(
              errorMessage: errorMessage.value,
              ports: ports.value,
              onPortsChanged: (newPorts) {
                errorMessage.value = null;
                ports.value = newPorts;
              },
            ),
            SizedBox(height: 12),
            if (installing.value)
              BottomFullWidthButton(
                child: Text("Installing..."),
                onPressed: null,
              ),
            if (!installing.value)
              BottomFullWidthButton(
                child: Text("Add rules"),
                onPressed: ports.value.isEmpty
                    ? null
                    : () => _handleSave(
                          ref,
                          formKey.value,
                          nameController.text,
                          ipAddress.text,
                          ports.value,
                          installing,
                          errorMessage,
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
    String name,
    String ipAddress,
    List<String> ports,
    ValueNotifier<bool> installing,
    ValueNotifier<String?> errorMessage,
  ) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    installing.value = true;

    try {
      await ref.read(firewallRuleRepositoryProvider).createFirewallRules(
            serverId: server.id,
            name: name,
            ipAddress: ipAddress,
            ports: ports,
          );
    } catch (e) {
      installing.value = false;

      if (e is FirewallRuleExistsException) {
        errorMessage.value = "Already whitelisted for selected ports.";
        return;
      }
    }

    compute(
      isolatedProgressCheck,
      ApiTokenAndServerId(apiToken: settings.apiKey, serverId: server.id),
    ).then((value) async {
      installing.value = false;
      ports.clear();

      await ref
          .read(notificationManagerProvider)
          .showFirewallRuleInstalledNotification(server);

      await windowManager.hide();
    });
  }
}
