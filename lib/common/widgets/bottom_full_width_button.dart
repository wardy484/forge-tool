import 'package:flutter/material.dart';

class BottomFullWidthButton extends StatelessWidget {
  const BottomFullWidthButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ElevatedButton(
                child: this.child,
                onPressed: this.onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
