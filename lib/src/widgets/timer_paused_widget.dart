import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/service/countdown_timer/bloc/countdown_cubit.dart';
import 'package:tomato_timer/src/widgets/pause_buttons.dart';

class TimerPausedWidget extends StatelessWidget {
  const TimerPausedWidget({required this.cubit, super.key});

  final CountDownCubit cubit;

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
        TypographyUI(cubit.formattedDuration, color: AppColors.greyDefault)
          ..h1Bold,
        const SizedBox(height: 24),
        ButtonUI(
          'Continue focando',
          onPressed: cubit.resumeTimer,
        )..solid,
        const SizedBox(height: 12),
        const PauseButtons(),
      ],
    );
  }
}
