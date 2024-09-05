import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tomato_timer/app/app_routing.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  int lapCount = 0;
  bool _watchTimerIsListen = false;
  final player = AudioPlayer();

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

  void playSound() {
    player.play();
    Future.delayed(const Duration(seconds: 4), player.pause);
  }

  Future<void> initPlayer() async {
    player.playbackEventStream.listen(
      (event) {},
      onError: (Object e, StackTrace stackTrace) {
        debugPrint('A stream error occurred: $e');
      },
    );
    try {
      // await player.setAudioSource(AudioSource.uri(
      //   Uri.parse('assets/sounds/marimba.mp3'),
      // ) TODO: nao esta funcionando audio local
      AudioSource.uri(
        Uri.parse(
          'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
        ),
      );
    } on PlayerException catch (e) {
      print('Error loading audio source: $e');
    }
  }
}

// TODO: OBS:: proximos passos 
//Ao terminar cada ciclo colocar som
