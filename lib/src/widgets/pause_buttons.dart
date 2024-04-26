import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';

class PauseButtons extends StatelessWidget {
  const PauseButtons({
    required this.onPressedBtn1,
    required this.onPressedBtn2,
    super.key,
  });

  final void Function() onPressedBtn1;
  final void Function() onPressedBtn2;
  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<TimerCubit>();

    return Row(
      children: [
        ButtonUI(
          'Pequeno intervalo',
          isExpanded: true,
          onPressed: () {
            cubit.stop();
            onPressedBtn1();
          },
        )..outlinedCustom(
            buttonColor: AppColors.black,
          ),
        const SizedBox(width: 12),
        ButtonUI(
          'Longo intervalo',
          isExpanded: true,
          onPressed: () {
            cubit.stop();
            onPressedBtn2();
          },
        )..outlinedCustom(
            buttonColor: AppColors.black,
          ),
      ],
    );
  }
}
