import 'package:bloc/bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

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
    emit(TimerLoading());
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromSecond(value),
    );
    emit(TimerLoaded());
  }
}

// TODO: OBS:: proximos passos 
// Na pausa longa colocar esse componente: https://www.figma.com/design/WoYG7xNjcgUvrDlsp9YXjS/Pomodoro-App---Chrome-Extension-(Community)?node-id=1-1030&t=BlCFMQQ2Dk0vBwhy-0
// Ao terminar os 4 ciclos jogar direto pra tela de Pausa longa
//Ao terminar cada ciclo colocar notificacao com som

