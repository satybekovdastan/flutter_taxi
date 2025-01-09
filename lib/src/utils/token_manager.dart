import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  // Создаем singleton для обеспечения единого экземпляра класса
  static final SharedPreferencesManager _instance = SharedPreferencesManager._internal();

  factory SharedPreferencesManager() {
    return _instance;
  }

  SharedPreferencesManager._internal();

  SharedPreferences? _prefs;

  // Инициализация SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Метод для сохранения строки
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // Метод для получения строки
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  // Метод для сохранения целого числа
  Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  // Метод для получения целого числа
  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  // Метод для сохранения булевого значения
  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  // Метод для получения булевого значения
  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  // Метод для удаления значения по ключу
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // Метод для очистки всех данных
  Future<void> clear() async {
    await _prefs?.clear();
  }

  static const String _accessTokenKey = 'access_token';

  void saveToken(String? token) async {
    if (token != null) {
      await SharedPreferencesManager().setString(_accessTokenKey, token);
    }
  }

  String? getToken() {
    return SharedPreferencesManager().getString(_accessTokenKey);
  }

  void removeToken() async {
    await SharedPreferencesManager().remove(_accessTokenKey);
  }

}