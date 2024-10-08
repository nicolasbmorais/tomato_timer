import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';
import 'package:tomato_timer/src/widgets/pause_buttons.dart';

class TimerPausedWidget extends StatelessWidget {
  const TimerPausedWidget({
    required this.timer,
    required this.cubit,
    super.key,
  });

  final String timer;
  final TimerCubit cubit;

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
        ButtonUI(
          'Continue focando',
          onPressed: () => cubit.start(context),
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
