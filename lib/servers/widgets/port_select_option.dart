import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class PortSelectOption extends StatelessWidget {
  final String port;
  final bool isChecked;
  final Function(String, bool?) onChanged;

  const PortSelectOption({
    Key? key,
    required this.port,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Row(
        children: [
          MacosCheckbox(
            value: isChecked,
            onChanged: (checked) {
              onChanged(port, checked);
            },
          ),
          const SizedBox(width: 8),
          Text(port),
        ],
      ),
    );
  }
}
