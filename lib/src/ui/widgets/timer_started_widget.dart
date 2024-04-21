import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

class TimerStartedWidget extends StatelessWidget {
  const TimerStartedWidget({
    required this.timer,
    required this.button,
    super.key,
  });

  final String timer;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        TypographyUI('Focando', color: AppColors.orangePrimary)..subheading,
        TypographyUI(timer, color: AppColors.orangePrimary)..h1Bold,
        const SizedBox(height: 24),
        button,
      ],
    );
  }
}
