import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tomato_timer/src/controllers/settings/settings_cubit.dart';

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

  final settingsCubit = Modular.get<SettingsCubit>();

  void startTimer(BuildContext context) {
    stopWatchTimer.onStartTimer();

    if (!_watchTimerIsListen) {
      stopWatchTimer.fetchEnded.listen((value) {
        if (lapCount < 4) {
          lapCount++;
          _watchTimerIsListen = true;
        }

        /// Somente após o if de cimma que o lapCount chega ao numero 4
        if (lapCount == 4) {
          lapCount++;
        }

        stopWatchTimer.onResetTimer();
        playTimerSound();
        emit(TimerInitial());
      });
    }
    _watchTimerIsListen = false;
    emit(TimerStarted());
  }

  Future<void> disposeTimer() async {
    await stopWatchTimer.dispose();
  }

  void stopTimer() {
    stopWatchTimer.onStopTimer();
    emit(TimerPaused());
  }

  void restartTimer() {
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

  Future<void> playTimerSound() async {
    await AudioPlayer.clearAssetCache();
    final sound = settingsCubit.settingsModel.timerSound;
    await player.setAsset('assets/sounds/$sound.mp3');

    unawaited(player.play());
    Future.delayed(const Duration(seconds: 5), player.pause);
  }
}

// Pomodoro App

// Task 1 - ajustar layout dos botões, colocar espaçamento certo

// Task 2 - rever telas de pausa

// Task 3 - revisar textos e tentar colocá-los menores

// Task 4 - revisar imagens e talvez trocar por outras

// Possíveis melhorias - colocar idioma l18n, fazer uma versão do app para Windows, alterar nome do app

// Nome pra loja: Be focus - pomodoro timer
