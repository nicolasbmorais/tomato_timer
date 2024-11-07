import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tomato_timer/src/controllers/settings/settings_cubit.dart';
import 'package:tomato_timer/src/service/countdown_timer/ticker.dart';

part 'countdown_state.dart';

class CountDownCubit extends Cubit<CountDownState> {
  CountDownCubit({required Ticker ticker, required SettingsCubit settingsCubit})
      : _ticker = ticker,
        _settingsCubit = settingsCubit,
        super(
          CountDownInitial(settingsCubit.getFocusDuration),
        ) {
    settingsCubit.getPreferences();
  }

  final Ticker _ticker;
  final SettingsCubit _settingsCubit;

  StreamSubscription<int>? _tickerSubscription;

  final _player = AudioPlayer();

  int lapCount = 0;
  int get lapCountN => 4 - lapCount;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void startTimer() {
    final durationInSeconds = _settingsCubit.getFocusDuration;
    emit(
      CountDownRunInProgress(durationInSeconds),
    );
    _tickerSubscription?.cancel();
    _tickerSubscription =
        _ticker.tick(ticks: durationInSeconds).listen(_onTicked);
  }

  void pauseTimer() {
    if (state is CountDownRunInProgress) {
      _tickerSubscription?.pause();
      emit(CountDownRunPause(state.duration));
    }
  }

  void resumeTimer() {
    if (state is CountDownRunPause) {
      _tickerSubscription?.resume();
      emit(CountDownRunInProgress(state.duration));
    }
  }

  void resetTimer() {
    _tickerSubscription?.cancel();
    emit(CountDownInitial(_settingsCubit.getFocusDuration));
  }

  void _onTicked(int durationInSeconds) {
    if (durationInSeconds > 0) {
      emit(CountDownRunInProgress(durationInSeconds));
    } else {
      lapCount++;
      _playTimerSound();
      emit(
        CountDownRunComplete(
          _settingsCubit.getFocusDuration,
        ),
      );
    }
  }

  Future<void> _playTimerSound() async {
    // await AudioPlayer.clearAssetCache(); Nao esta passando nesse cache
    final sound = _settingsCubit.settingsModel.timerSound
        .replaceAll(' ', '-')
        .toLowerCase();
    await _player.setAsset('assets/sounds/$sound.mp3');

    unawaited(_player.play());
    Future.delayed(const Duration(seconds: 5), _player.pause);
  }

  void disposePlayer() {
    _player.dispose();
  }

  String get formattedDuration {
    final minutes =
        ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (state.duration % 60).toString().padLeft(2, '0');
    return '00:$minutes:$seconds';
  }
}
