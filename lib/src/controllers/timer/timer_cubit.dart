import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tomato_timer/src/controllers/settings/settings_cubit.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  int lapCount = 0;
  bool _watchTimerIsListen = false;

  final SettingsCubit _settingsCubit = Modular.get<SettingsCubit>();

  StopWatchTimer get stopWatchTimer => StopWatchTimer(
        mode: StopWatchMode.countDown,
        presetMillisecond: StopWatchTimer.getMilliSecFromSecond(
          _settingsCubit.settingsModel.focusDuration ?? 5,
        ),
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
