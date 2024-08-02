import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:tomato_timer/src/models/settings_model.dart';
import 'package:tomato_timer/src/service/secure_storage.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  final SharedPreferencesService _prefs = SharedPreferencesService();
  UserSettingsModel userSettingsModel = UserSettingsModel.empty();

  Future<void> applyPreferences() async {
    final data = UserSettingsModel(
      showCompleteNotification: false,
      focusDuration: 5,
      longBreak: 10,
      shortBreak: 5,
      timerSound: '',
    );

    final convert = jsonEncode(data.toJson());
    await _prefs.setString('userPrefs', convert);
  }

  Future<void> getPreferences() async {
    final data = _prefs.getString('userPrefs'); //TODO ver pq esta vindo nulo

    final json = jsonDecode(data!) as Map<String, dynamic>;

    userSettingsModel = UserSettingsModel.fromJson(json); 
    print(userSettingsModel);
  }
}
