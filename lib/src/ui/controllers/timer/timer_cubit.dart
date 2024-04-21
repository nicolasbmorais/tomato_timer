import 'package:bloc/bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  int lapCount = 0;

  StopWatchTimer stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(25),
  );

  Future<void> disposeTimer() async {
    await stopWatchTimer.dispose();
  }

  void start() {
    stopWatchTimer.onStartTimer();
    stopWatchTimer.fetchEnded.listen((value) {
      if (lapCount <= 0 && lapCount < 4) {
        lapCount++;
      }
      stopWatchTimer.onResetTimer();
      emit(TimerInitial());
    });
    emit(TimerStarted());
  }

  void stop() {
    stopWatchTimer.onStopTimer();
    emit(TimerPaused());
  }

  void restart() {
    stopWatchTimer.onResetTimer();
    emit(TimerInitial());
  }
}
