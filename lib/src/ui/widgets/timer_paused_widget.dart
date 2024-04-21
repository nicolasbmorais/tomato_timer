import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

class TimerPausedWidget extends StatelessWidget {
  const TimerPausedWidget({
    required this.timer,
    required this.button,
    super.key,
  });

  final String timer;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: AppColors.orangePrimary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            TypographyUI('Pausado', color: AppColors.black)..subheading,
          ],
        ),
        TypographyUI(timer, color: AppColors.greyDefault)..h1Bold,
        const SizedBox(height: 24),
        button,
      ],
    );
  }
}
