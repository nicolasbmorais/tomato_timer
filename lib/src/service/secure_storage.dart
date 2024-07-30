import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Acesso à instância singleton
  factory SharedPreferencesService() {
    return _instance;
  }

  // Construtor privado
  SharedPreferencesService._internal();
  // Instância singleton
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();

  // Instância do SharedPreferences
  SharedPreferences? _prefs;

  // Inicializa o SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Métodos para salvar valores
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // Métodos para obter valores
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }
}
