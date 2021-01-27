import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static String tokenKey= "token_key";

  static SharedPreferences _sp;

  static Future<SharedPreferences> get sp async {
    if (_sp == null) {
      _sp = await SharedPreferences.getInstance();
    }
    return _sp;
  }

  static Future<bool> save(String key, String value) async {
    return (await sp).setString(key, value);
  }

  static dynamic get(String key) async {
    return (await sp).get(key);
  }

  static Future<bool> remove(String key) async {
    return (await sp).remove(key);
  }
}