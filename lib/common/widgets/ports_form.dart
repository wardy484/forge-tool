import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PortsForm extends HookConsumerWidget {
  const PortsForm({
    super.key,
    required this.errorMessage,
    required this.ports,
    required this.onPortsChanged,
  });

  final String? errorMessage;
  final List<String> ports;
  final Function(List<String> ports) onPortsChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final portController = useTextEditingController();
    final portInputFocusNode = useFocusNode();

    final addPort = () {
      if (!formKey.value.currentState!.validate()) {
        return;
      }

      onPortsChanged([...ports, portController.text]);

      formKey.value.currentState!.reset();
      portController.clear();
      portInputFocusNode.requestFocus();
    };

    return Column(
      children: [
        Form(
          key: formKey.value,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    if (portController.text.isEmpty) {
                      return "Please specify a port.";
                    }

                    if (ports.contains(portController.text)) {
                      return "Port already added.";
                    }

                    if (int.tryParse(portController.text) == null) {
                      return "Port must be a number.";
                    }

                    return null;
                  },
                  onFieldSubmitted: (value) => addPort(),
                ),
              ),
              SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: ElevatedButton.icon(
                  onPressed: addPort,
                  icon: Icon(Icons.add),
                  label: Text("Add Port"),
                ),
              ),
            ],
          ),
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
        if (ports.isEmpty)
          Align(
            alignment: Alignment.centerLeft,
            child: Text("No ports selected."),
          ),
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        if (ports.isNotEmpty)
          Row(
            children: ports
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Chip(
                      label: Text(e),
                      onDeleted: () {
                        final remainingPorts =
                            ports.where((port) => port != e).toList();

                        onPortsChanged(remainingPorts);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}
