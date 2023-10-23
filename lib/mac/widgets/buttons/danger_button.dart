import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class DangerButton extends StatelessWidget {
  final Function() onPressed;
  final String label;

  const DangerButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PushButton(
            controlSize: ControlSize.large,
            onPressed: onPressed,
            color: Colors.red,
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
