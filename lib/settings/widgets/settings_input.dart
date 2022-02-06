import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class SettingsInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController controller;

  const SettingsInput({
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MacosTextField(
        controller: controller,
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MacosIcon(icon),
        ),
        placeholder: placeholder,
        maxLines: 1,
      ),
    );
  }
}
