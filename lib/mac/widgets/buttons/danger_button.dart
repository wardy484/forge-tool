import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

// Laaaana! Danger zoooone!
// Kenny godded damn loggins!
class DangerButton extends StatelessWidget {
  final Function() onPressed;
  final String label;

  const DangerButton({
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
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
