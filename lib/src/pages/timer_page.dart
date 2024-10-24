import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tomato_timer/core/core.dart';
import 'package:tomato_timer/src/controllers/timer/timer_cubit.dart';
import 'package:tomato_timer/src/widgets/notes_content.dart';
import 'package:tomato_timer/src/widgets/timer_initial_widget.dart';
import 'package:tomato_timer/src/widgets/timer_paused_widget.dart';
import 'package:tomato_timer/src/widgets/timer_started_widget.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with WidgetsBindingObserver {
  final cubit = Modular.get<TimerCubit>();

  @override
  void dispose() {
    cubit.player.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //   if (state == AppLifecycleState.paused) {
  //     // Release the player's resources when not in use. We use "stop" so that
  //     // if the app resumes later, it will still remember what position to
  //     // resume from.
  //     cubit.player.stop();
  //   }
  // }

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
                list: const [1, 2, 3, 4],
                onChange: (i) {},
                page: cubit.lapCount - 1,
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
              const NotesContent(),
            ],
          );
        },
      ),
    );
  }
}
