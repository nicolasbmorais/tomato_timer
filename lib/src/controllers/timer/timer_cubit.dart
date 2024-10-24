import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tomato_timer/src/models/settings_model.dart';
import 'package:tomato_timer/src/service/shared_preferences.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  int lapCount = 0;
  bool _watchTimerIsListen = false;
  final player = AudioPlayer();
  // final settingsCubit = Modular.get<SettingsCubit>();

  final SharedPreferencesService _prefs = SharedPreferencesService();
  UserSettingsModel settingsModel = UserSettingsModel.empty();

  String? focusDuration;
  String? shortBreak;
  String? longBreak;
  String? timeSoundName;
  bool showCompleteNotification = true;
  bool restartAutomatically = true;

  StopWatchTimer stopWatchTimer = StopWatchTimer();
  // mode: StopWatchMode.countDown,
  // presetMillisecond: StopWatchTimer.getMilliSecFromMinute(25),
  // // TODOpreciso passar o valor do model aqui pra dentro
  // );

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
    final sound = settingsModel.timerSound;
    await player.setAsset('assets/sounds/$sound.mp3');

    unawaited(player.play());
    Future.delayed(const Duration(seconds: 5), player.pause);
  }

  Future<void> applyPreferences() async {
    try {
      emit(TimerLoading());

      await Future.delayed(const Duration(seconds: 1), () async {
        final body = UserSettingsModel(
          focusDuration: int.parse(focusDuration ?? '13'),
          shortBreak: int.parse(shortBreak ?? '13'),
          longBreak: int.parse(longBreak ?? '13'),
          timerSound: timeSoundName ?? 'Bip Alarm',
          showCompleteNotification: showCompleteNotification,
          restartAutomatically: restartAutomatically,
        );

        final convert = jsonEncode(body.toJson());
        await _prefs.setString('userPrefs', convert);

        await getPreferences();
        
        setTimerValue(body.focusDuration);
      });

      emit(TimerLoaded());
    } catch (e) {
      emit(TimerCanceled());
    }
  }

  Future<void> getPreferences() async {
    emit(TimerLoading());

    final data = _prefs.getString('userPrefs') ?? '';
    if (data.isNotEmpty) {
      final json = jsonDecode(data) as Map<String, dynamic>;

      settingsModel = UserSettingsModel.fromJson(json);
    }
    emit(SettingsLoaded());
  }

  void apagar() {
    _prefs.clear();
  }
}

// Pomodoro App

// Task 1 - ajustar layout dos botões, colocar espaçamento certo

// Task 2 - rever telas de pausa

// Task 3 - revisar textos e tentar colocá-los menores

// Task 4 - revisar imagens e talvez trocar por outras

// Possíveis melhorias - colocar idioma l18n, fazer uma versão do app para Windows, alterar nome do app

// Nome pra loja: Be focus - pomodoro timer
