import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ProgressCircle(
        value: null,
      ),
    );
  }
}
