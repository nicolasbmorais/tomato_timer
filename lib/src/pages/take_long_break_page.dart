import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';

class TakeLongBreakPage extends StatelessWidget {
  const TakeLongBreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<TimerCubit>();

    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          TypographyUI('Faça uma longa pausa')..h2Bold,
          const SizedBox(height: 16),
          TypographyUI('Parabéns pelo excelente trabalho!')..body1,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: SvgUI(
              size: 300,
            )..personLongBreak,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgUI(
                onTap: () {
                  cubit.restart();
                  Modular.to.popUntil(ModalRoute.withName(AppRouting.homePage));
                },
              )..restart,
              const SizedBox(width: 8),
              TypographyUI('Reiniciar o ciclo pomodoro')..body1,
            ],
          ),
        ],
      ),
    );
  }
}
