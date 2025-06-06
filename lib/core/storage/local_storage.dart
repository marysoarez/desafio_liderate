import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static LocalStorage? _instance;
  late SharedPreferences _prefs;

  LocalStorage._internal();

  static Future<LocalStorage> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorage._internal();
      await _instance!._init();
    }
    return _instance!;
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

}
