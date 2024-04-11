import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/ui/widgets/notes_content_widget.dart';
import 'package:tomato_timer/src/ui/widgets/timer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const step = 0;

    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: Column(
        children: [
          const SizedBox(height: 16),
          FlutterStepIndicator(
            height: 20,
            list: const [0, 1, 2, 3],
            onChange: (i) {},
            page: step,
            progressColor: AppColors.orangePrimary,
            negativeColor: AppColors.lightGrey200,
            positiveColor: AppColors.orangePrimary,
            positiveCheck: const SizedBox(),
          ),
          // TimerWidget(
          //   title: 'title',
          //   timer: 'timer',
          //   button: ButtonUI('Comece a focar')..solid, //TODO: estado inicial
          // ),
          // TimerWidget(
          //   title: 'Concentrando',
          //   timer: 'timer',
          //   button: Column(
          //     children: [
          //       ButtonUI('Pausar')..outlined,
          //       const SizedBox(height: 12),
          //       _pauseButtons(),
          //     ],
          //   ), //TODO: Estado concentrando
          // ),
          TimerWidget(
            title: 'Pausado',
            timer: 'timer',
            button: Column(
              children: [
                ButtonUI('Continuar concentrando')..outlined,
                const SizedBox(height: 12),
                _pauseButtons(),
              ],
            ), //TODO: Estado pausado
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TypographyUI('Notas')..title,
              ButtonUI(
                'Adicionar notas',
                color: AppColors.orangePrimary,
                onPressed: () {
                  Modular.to.pushNamed(AppRouting.homePage);
                },
              )..textButton,
            ],
          ),
          const SizedBox(height: 24),
          const NotesContentWidget(),
        ],
      ),
    );
  }

  Row _pauseButtons() {
    return Row(
      children: [
        ButtonUI(
          'Pequeno intervalo',
          isExpanded: true,
          onPressed: () => Modular.to.pushNamed(AppRouting.shortBreakPage),
        )..outlinedCustom(
            buttonColor: AppColors.black,
          ),
        const SizedBox(width: 12),
        ButtonUI(
          'Longo intervalo',
          isExpanded: true,
          onPressed: () => Modular.to.pushNamed(AppRouting.longBreakPage),
        )..outlinedCustom(
            buttonColor: AppColors.black,
          ),
      ],
    );
  }
}
