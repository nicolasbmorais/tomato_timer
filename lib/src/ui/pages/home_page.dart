import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/ui/controllers/timer/timer_cubit.dart';
import 'package:tomato_timer/src/ui/widgets/notes_content_widget.dart';
import 'package:tomato_timer/src/ui/widgets/timer_initial_widget.dart';
import 'package:tomato_timer/src/ui/widgets/timer_paused_widget.dart';
import 'package:tomato_timer/src/ui/widgets/timer_started_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final step = 0;
  final cubit = Modular.get<TimerCubit>();

  // @override
  // Future<void> dispose() async {
  //   super.dispose();
  //   await cubit.stopWatchTimer.dispose();
  // }

  @override
  Widget build(BuildContext context) {
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
          //   button: ButtonUI('Comece a focar')..solid,
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
          //   ),
          // ),
          StreamBuilder<int>(
            stream: cubit.stopWatchTimer.rawTime,
            initialData: cubit.stopWatchTimer.rawTime.value,
            builder: (context, state) {
              final displayTime = StopWatchTimer.getDisplayTime(
                state.data!,
                milliSecond: false,
              );

              return BlocBuilder<TimerCubit, TimerState>(
                bloc: cubit,
                builder: (context, state) {
                  if (state is TimerStarted) {
                    return TimerStartedWidget(
                      timer: displayTime,
                      button: Column(
                        children: [
                          ButtonUI(
                            'Pausar',
                            onPressed: cubit.stop,
                          )..outlined,
                          const SizedBox(height: 12),
                          _pauseButtons(),
                        ],
                      ),
                    );
                  }
                  if (state is TimerPaused) {
                    return TimerPausedWidget(
                      timer: displayTime,
                      button: Column(
                        children: [
                          ButtonUI(
                            'Continue focando',
                            onPressed: cubit.start,
                          )..solid,
                          const SizedBox(height: 12),
                          _pauseButtons(),
                        ],
                      ),
                    );
                  }

                  return TimerInitialWidget(timer: displayTime, cubit: cubit);
                },
              );
            },
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
          onPressed: () => Modular.to.pushNamed(AppRouting.shortBreakInfoPage),
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
