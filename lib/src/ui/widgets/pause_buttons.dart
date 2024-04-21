import 'package:flutter/material.dart';
import 'package:tomato_timer/core/core.dart';

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
    return Row(
      children: [
        ButtonUI(
          'Pequeno intervalo',
          isExpanded: true,
          onPressed: onPressedBtn1,
        )..outlinedCustom(
            buttonColor: AppColors.black,
          ),
        const SizedBox(width: 12),
        ButtonUI(
          'Longo intervalo',
          isExpanded: true,
          onPressed: onPressedBtn2,
        )..outlinedCustom(
            buttonColor: AppColors.black,
          ),
      ],
    );
  }
}
