import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/ui/controllers/timer/timer_cubit.dart';
import 'package:tomato_timer/src/ui/widgets/pause_buttons.dart';

class TimerStartedWidget extends StatelessWidget {
  const TimerStartedWidget({
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
        TypographyUI('Focando', color: AppColors.orangePrimary)..subheading,
        TypographyUI(timer, color: AppColors.orangePrimary)..h1Bold,
        const SizedBox(height: 24),
        ButtonUI(
          'Pausar',
          onPressed: cubit.stop,
        )..solid,
        const SizedBox(height: 12),
        PauseButtons(
          onPressedBtn1: () {
            Modular.to.pushNamed(AppRouting.shortBreakInfoPage);
          },
          onPressedBtn2: () {
            Modular.to.pushNamed(AppRouting.longBreakPage);
          },
        ),
      ],
    );
  }
}
