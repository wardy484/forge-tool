import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forge/firewall_rules/data/firewall_rule_repsitory.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/settings/data/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final portController = useTextEditingController();
    final ports = useState(<String>[]);
    final portErrorMessage = useState<String?>(null);
    final portInputFocusNode = useFocusNode();

    final addPort = () {
      if (portController.text.isEmpty) {
        portErrorMessage.value = "Please specify a port.";
        return;
      }

      if (ports.value.contains(portController.text)) {
        portErrorMessage.value = "Port already added.";
        return;
      }

      if (int.tryParse(portController.text) == null) {
        portErrorMessage.value = "Port must be a number.";
        return;
      }

      ports.value = [...ports.value, portController.text];
      portController.clear();
      portInputFocusNode.requestFocus();
    };

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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    focusNode: portInputFocusNode,
                    controller: portController,
                    decoration: const InputDecoration(
                      labelText: "Port",
                      hintText: "Enter your port",
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a port";
                      }

                      return null;
                    },
                    onFieldSubmitted: (value) => addPort(),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton.icon(
                  onPressed: addPort,
                  icon: Icon(Icons.add),
                  label: Text("Add Port"),
                ),
              ],
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Selected ports:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 3),
            if (ports.value.isEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: Text("No ports selected."),
              ),
            if (ports.value.isNotEmpty)
              Row(
                children: ports.value
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Chip(
                          label: Text(e),
                          onDeleted: () {
                            ports.value =
                                ports.value.where((port) => port != e).toList();
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            SizedBox(height: 12),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text("Add rules"),
                        onPressed: ports.value.isNotEmpty
                            ? () => _handleSave(
                                  ref,
                                  formKey.value,
                                  nameController.text,
                                  ipAddress.text,
                                  ports.value,
                                )
                            : null,
                      ),
                    ),
                  ],
                ),
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
  ) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    ref.read(firewallRuleRepositoryProvider).createFirewallRules(
          serverId: server.id,
          name: name,
          ipAddress: ipAddress,
          ports: ports,
        );
  }
}
