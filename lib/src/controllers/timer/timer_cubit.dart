import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tomato_timer/app/app_routing.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  int lapCount = 0;
  bool _watchTimerIsListen = false;

  StopWatchTimer stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromMinute(25),
  );

  Future<void> disposeTimer() async {
    await stopWatchTimer.dispose();
  }

  void start(BuildContext context) {
    stopWatchTimer.onStartTimer();

    if (!_watchTimerIsListen) {
      stopWatchTimer.fetchEnded.listen((value) {
        if (lapCount <= 4) {
          lapCount++;
          _watchTimerIsListen = true;
        }
        if (lapCount == 4) {
          Modular.to.pushNamed(AppRouting.longBreakPage);
        }
        stopWatchTimer.onResetTimer();
        emit(TimerInitial());
      });
    }

    _watchTimerIsListen = false;
    emit(TimerStarted());
  }

  void stop() {
    stopWatchTimer.onStopTimer();
    emit(TimerPaused());
  }

  void restart() {
    stopWatchTimer.onResetTimer();
    lapCount = 0;
    emit(TimerInitial());
  }

  void setTimerValue(int value) {
    emit(TimerLoading());
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromMinute(value),
    );
    emit(TimerLoaded());
  }
}

// TODO: OBS:: proximos passos 
//Ao terminar cada ciclo colocar notificacao com som

