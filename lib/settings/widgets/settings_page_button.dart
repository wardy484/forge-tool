import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class SettingsPageButton extends StatelessWidget {
  final Function() onPressed;
  final String label;

  const SettingsPageButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PushButton(
            child: Text(label),
            buttonSize: ButtonSize.large,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
