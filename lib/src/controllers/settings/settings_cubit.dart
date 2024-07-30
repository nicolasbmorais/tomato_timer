import 'package:bloc/bloc.dart';
import 'package:tomato_timer/src/service/secure_storage.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  final SharedPreferencesService _sharedPreferencesService = 
  SharedPreferencesService();

  
  Future<void> teste() async {
//     await prefs.setInt('counter', 10);
// // Save an boolean value to 'repeat' key.
//     await prefs.setBool('repeat', true);
// // Save an double value to 'decimal' key.
//     await prefs.setDouble('decimal', 1.5);
// // Save an String value to 'action' key.
//     await prefs.setString('action', 'Start');
// // Save an list of strings to 'items' key.
//     await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
  }
}
