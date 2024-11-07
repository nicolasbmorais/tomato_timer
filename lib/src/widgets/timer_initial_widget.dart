import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/service/countdown_timer/bloc/countdown_cubit.dart';

class TimerInitialWidget extends StatelessWidget {
  const TimerInitialWidget({required this.cubit, super.key});

  final CountDownCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        TypographyUI('Pronto?', color: AppColors.greyDefault)..subheading,
        TypographyUI(cubit.formattedDuration, color: AppColors.greyDefault)
          ..h1Bold,
        const SizedBox(height: 24),
        ButtonUI(
          'Começar foco',
          onPressed: cubit.startTimer,
        )..outlined,
      ],
    );
  }
}
