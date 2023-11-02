import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class SettingsPageButton extends StatelessWidget {
  final Function() onPressed;
  final String label;

  const SettingsPageButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PushButton(
          controlSize: ControlSize.large,
          onPressed: onPressed,
          child: Text(label),
        ),
      ],
    );
  }
}
