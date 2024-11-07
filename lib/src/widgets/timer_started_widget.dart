import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/service/countdown_timer/bloc/countdown_cubit.dart';
import 'package:tomato_timer/src/widgets/pause_buttons.dart';

class TimerStartedWidget extends StatelessWidget {
  const TimerStartedWidget({required this.cubit, super.key});

  final CountDownCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        TypographyUI('Focando', color: AppColors.orangePrimary)..subheading,
        TypographyUI(cubit.formattedDuration, color: AppColors.orangePrimary)
          ..h1Bold,
        const SizedBox(height: 24),
        ButtonUI(
          'Pausar',
          onPressed: cubit.pauseTimer,
        )..solid,
        const SizedBox(height: 12),
        const PauseButtons(),
      ],
    );
  }
}
