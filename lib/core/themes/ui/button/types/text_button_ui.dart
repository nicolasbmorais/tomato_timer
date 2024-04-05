import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

class TextButtonUI extends StatelessWidget {
  const TextButtonUI({
    required this.text,
    required this.height,
    required this.textColor,
    this.onPressed,
    super.key,
  });

  final String text;
  final double height;
  final Color textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(53),
        ),
      ),
      child: SizedBox(
        height: height,
        child: Center(
          child: TypographyUI(
            text,
            color: textColor,
          )..body1,
        ),
      ),
    );
  }
}
