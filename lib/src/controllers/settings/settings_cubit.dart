import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:tomato_timer/src/models/settings_model.dart';
import 'package:tomato_timer/src/service/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial()) {
    getPreferences();
  }

  final SharedPreferencesService _prefs = SharedPreferencesService();
  UserSettingsModel settingsModel = UserSettingsModel.empty();

  String focusDuration = '';
  String shortBreak = '';
  String longBreak = '';
  String timeSoundName = 'bip-alarm';
  bool showCompleteNotification = true;
  bool restartAutomatically = true;

  Future<void> applyPreferences() async {
    emit(SettingsLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () async {
        final convert = jsonEncode(
          UserSettingsModel(
            focusDuration: int.tryParse(focusDuration) ?? 25,
            shortBreak: int.tryParse(shortBreak) ?? 5,
            longBreak: int.tryParse(longBreak) ?? 20,
            timerSound: timeSoundName,
            showCompleteNotification: showCompleteNotification,
            restartAutomatically: restartAutomatically,
          ).toJson(),
        );

        await _prefs.setString('userPrefs', convert);
        await getPreferences();
      });
      emit(SettingsLoaded());
    } catch (e) {
      emit(SettingsError());
    }
  }

  Future<void> getPreferences() async {
    final data = _prefs.getString('userPrefs') ?? '';
    if (data.isNotEmpty) {
      final json = jsonDecode(data);

      settingsModel = UserSettingsModel.fromJson(
        json as Map<String, dynamic>,
      );
    }
  }
}
