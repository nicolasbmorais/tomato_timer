import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tomato_timer/app/app_routing.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';
import 'package:tomato_timer/src/widgets/notes_content_widget.dart';
import 'package:tomato_timer/src/widgets/timer_initial_widget.dart';
import 'package:tomato_timer/src/widgets/timer_paused_widget.dart';
import 'package:tomato_timer/src/widgets/timer_started_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = Modular.get<TimerCubit>();

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      appBar: const DefaultAppBarUI(),
      body: BlocBuilder<TimerCubit, TimerState>(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 16),
              FlutterStepIndicator(
                height: 20,
                list: const [0, 1, 2, 3],
                onChange: (i) {},
                page: cubit.lapCount,
                progressColor: AppColors.orangePrimary,
                negativeColor: AppColors.lightGrey200,
                positiveColor: AppColors.orangePrimary,
                positiveCheck: const SizedBox(),
              ),
              StreamBuilder<int>(
                stream: cubit.stopWatchTimer.rawTime,
                initialData: cubit.stopWatchTimer.rawTime.value,
                builder: (context, snapshot) {
                  final displayTime = StopWatchTimer.getDisplayTime(
                    snapshot.data!,
                    milliSecond: false,
                  );

                  if (state is TimerStarted) {
                    return TimerStartedWidget(timer: displayTime, cubit: cubit);
                  }

                  if (state is TimerPaused) {
                    return TimerPausedWidget(timer: displayTime, cubit: cubit);
                  }

                  return TimerInitialWidget(timer: displayTime, cubit: cubit);
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
          );
        },
      ),
    );
  }
}
