import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';

class TimerInitialWidget extends StatelessWidget {
  const TimerInitialWidget({
    required this.timer,
    required this.cubit,
    super.key,
  });

  final String timer;
  final TimerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        TypographyUI('Pronto?', color: AppColors.greyDefault)..subheading,
        TypographyUI(timer, color: AppColors.greyDefault)..h1Bold,
        const SizedBox(height: 24),
        ButtonUI(
          'Comece a focar',
          onPressed: () => cubit.start(context),
        )..outlined,
      ],
    );
  }
}
