import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String subtitle;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosListTile(
      leading: leading,
      title: Text(
        title,
        style: MacosTheme.of(context).typography.headline,
      ),
      subtitle: Text(
        subtitle,
        style: MacosTheme.of(context).typography.subheadline.copyWith(
              color: MacosColors.systemGrayColor,
            ),
      ),
    );
  }
}
