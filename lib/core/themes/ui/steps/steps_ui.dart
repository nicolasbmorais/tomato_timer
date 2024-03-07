import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tomato_timer/core/core.dart';

class StepsUI extends StatelessWidget {
  const StepsUI({
    required this.totalSteps,
    required this.currentStep,
    super.key,
  });

  final int totalSteps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      size: 2,
      totalSteps: totalSteps,
      currentStep: currentStep,
      customColor: (i) {
        if (i == currentStep - 1) {
          return AppColors.black;
        } else {
          return AppColors.enabledBorderButton;
        }
      },
    );
  }
}
