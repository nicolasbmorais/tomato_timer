import 'package:bloc/bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  StopWatchTimer stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromMinute(25),
  );

  Future<void> disposeTimer() async {
    await stopWatchTimer.dispose();
  }

  void start() {
    stopWatchTimer.onStartTimer();
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

  void clear() {
    stopWatchTimer.clearPresetTime();
  }
}
