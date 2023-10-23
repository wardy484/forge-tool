import 'package:flutter/material.dart';
import 'package:forge/whitelist/pages/whitelist_page.dart';
import 'package:macos_ui/macos_ui.dart';

class PortSelectOption extends StatelessWidget {
  final WhitelistPort port;
  final bool isChecked;
  final Function(WhitelistPort, bool?) onChanged;

  const PortSelectOption({
    super.key,
    required this.port,
    required this.isChecked,
    required this.onChanged,
  });

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
          Text(port.label),
        ],
      ),
    );
  }
}
