import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tomato_timer/src/models/settings_model.dart';
import 'package:tomato_timer/src/service/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial()) {
    getPreferences();
  }

  final SharedPreferencesService _prefs = SharedPreferencesService();
  UserSettingsModel _settingsModel = UserSettingsModel.empty();
  UserSettingsModel get settingsModel => _settingsModel;

  int get getFocusDuration => settingsModel.focusDuration * 60;

  ///Timer page
  final int _lapCount = 0;
  int get lapCount => _lapCount;

  int get faltaN => 4 - lapCount;

  /// Settings Page
  int? focusDuration;
  int? shortBreak;
  int? longBreak;
  String? timeSoundName;
  bool? showCompleteNotification;
  bool? restartAutomatically;

  Future<void> applyPreferences() async {
    try {
      emit(SettingsLoading());

      await Future.delayed(const Duration(seconds: 1), () async {
        final body = UserSettingsModel(
          focusDuration: focusDuration ?? settingsModel.focusDuration,
          shortBreak: shortBreak ?? settingsModel.shortBreak,
          longBreak: longBreak ?? settingsModel.longBreak,
          timerSound: timeSoundName ?? settingsModel.timerSound,
          showCompleteNotification: settingsModel.showCompleteNotification,
          restartAutomatically:
              restartAutomatically ?? settingsModel.restartAutomatically,
        );

        final convert = jsonEncode(body.toJson());
        await _prefs.setString('userPrefs', convert);

        await getPreferences();
      });

      emit(SettingsLoaded());
    } catch (e) {
      debugPrint(e.toString());
      emit(SettingsError());
    }
  }

  Future<void> getPreferences() async {
    emit(SettingsLoading());

    final data = _prefs.getString('userPrefs') ?? '';
    if (data.isNotEmpty) {
      final json = jsonDecode(data) as Map<String, dynamic>;
      _settingsModel = UserSettingsModel.fromJson(json);
    }

    emit(SettingsLoaded());
  }

  void clearAllPrefs() {
    _prefs.clear();
  }
}


// Pomodoro App
// Agora testar em outro device e ver se o som funciona (nao esta funcionando)
// 

//TODO:alterar nome do app para Be focus  e  Nome para loja: Be focus - pomodoro timer

