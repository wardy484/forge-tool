import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forge/firewall_rules/data/firewall_rule_repsitory.dart';
import 'package:forge/forge/model/server/server.dart';
import 'package:forge/settings/settings_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class CustomFirewallRuleForm extends HookConsumerWidget {
  const CustomFirewallRuleForm({
    super.key,
    required this.server,
    required this.defaultIpAddress,
  });

  final Server server;
  final String defaultIpAddress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final portController = useTextEditingController();
    final ipAddress = useTextEditingController(text: defaultIpAddress);
    final ports = useState(<String>[]);
    final portErrorMessage = useState<String?>(null);

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
    };

    useEffect(() {
      ref.read(settingsNotifierProvider).whenOrNull(
        valid: (settings) async {
          nameController.text = settings.name;
        },
      );

      return null;
    }, []);

    return Expanded(
      child: Form(
        key: formKey.value,
        child: Column(
          children: [
            TextInput(
              controller: nameController,
              label: 'Name:',
              icon: CupertinoIcons.person,
              placeholder: 'Name',
            ),
            SizedBox(height: 8),
            TextInput(
              controller: ipAddress,
              label: 'IP Address:',
              icon: CupertinoIcons.person,
              placeholder: 'IP Address',
            ),
            SizedBox(height: 8),
            TextInput(
              controller: portController,
              label: 'Port:',
              icon: CupertinoIcons.person,
              placeholder: 'Port',
              errorText: portErrorMessage.value,
              infoText: "Hit enter to add port.",
              onSubmitted: (value) => addPort(),
            ),
            SizedBox(height: 8),
            LabelledContent(
              label: Text("Selected Ports:"),
              content: Row(
                children: ports.value
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            child: Text(e),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PushButton(
                  child: Text("Add rule"),
                  controlSize: ControlSize.large,
                  onPressed: () async {
                    ref
                        .read(firewallRuleRepositoryProvider)
                        .createFirewallRules(
                      serverId: server.id,
                      name: nameController.text,
                      ipAddress: ipAddress.text,
                      ports: [portController.text],
                    );

                    // TODO: Create a provider class to handle loading and fetching etc
                    // Loading and fetching what dickhead
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.placeholder,
    this.onSubmitted,
    this.errorText,
    this.infoText,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String placeholder;
  final void Function(String)? onSubmitted;
  final String? errorText;
  final String? infoText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelledContent(
          label: Text(label),
          content: MacosTextField(
            controller: controller,
            prefix: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MacosIcon(icon),
            ),
            onSubmitted: onSubmitted,
            placeholder: placeholder,
            maxLines: 1,
          ),
        ),
        if (errorText != null || infoText != null) SizedBox(height: 2),
        if (errorText != null)
          LabelledContent(
            content: Text(
              errorText!,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          )
        else if (infoText != null)
          LabelledContent(
            content: Text(infoText!, style: TextStyle(fontSize: 12)),
          ),
      ],
    );
  }
}

class LabelledContent extends StatelessWidget {
  const LabelledContent({
    super.key,
    this.label,
    required this.content,
  });

  final Widget? label;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              label ?? SizedBox(),
            ],
          ),
          flex: 5,
        ),
        SizedBox(width: 8),
        Expanded(
          child: content,
          flex: 22,
        ),
      ],
    );
  }
}
