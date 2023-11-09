import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

final hideWindowKeySet = LogicalKeySet(
  LogicalKeyboardKey.meta, // Replace with control on Windows
  LogicalKeyboardKey.keyW,
);

class HideWindowIntent extends Intent {}

class CloseShortcut extends ConsumerWidget {
  const CloseShortcut({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FocusableActionDetector(
      autofocus: true,
      shortcuts: {
        hideWindowKeySet: HideWindowIntent(),
      },
      actions: {
        HideWindowIntent: CallbackAction(onInvoke: (e) {
          windowManager.hide();
          return null;
        }),
      },
      child: child,
    );
  }
}
