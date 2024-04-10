import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    required this.title,
    required this.timer,
    required this.button,
    super.key,
  });

  final String title;
  final String timer;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        TypographyUI(title, color: AppColors.greyDefault)..subheading,
        TypographyUI('00:00:00', color: AppColors.greyDefault)..h1Bold,
        const SizedBox(height: 24),
        button,
      ],
    );
  }
}
