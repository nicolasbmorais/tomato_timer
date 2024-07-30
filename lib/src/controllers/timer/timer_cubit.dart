import 'package:bloc/bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial()){
//TODO: iniciar dados aqui
  }

  int lapCount = 0;
  bool _watchTimerIsListen = false;

  StopWatchTimer stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(5),
  );

  Future<void> disposeTimer() async {
    await stopWatchTimer.dispose();
  }

  void start() {
    stopWatchTimer.onStartTimer();

    if (!_watchTimerIsListen) {
      stopWatchTimer.fetchEnded.listen((value) {
        if (lapCount <= 4) {
          lapCount++;
          _watchTimerIsListen = true;
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
    stopWatchTimer.setPresetSecondTime(value);
  }
}
