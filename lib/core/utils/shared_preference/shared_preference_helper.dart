import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/constants/app_constants.dart';

class SharedPreferencesHelper {
  final SharedPreferences sharedPreference;

  SharedPreferencesHelper({required this.sharedPreference});

  Future<bool> set(String key, String value) {
    return sharedPreference.setString(key, value);
  }

  Future<void> setInt(String key, int value) async {
    sharedPreference.setInt(key, value);
    sharedPreference.reload();
  }

  Future<void> setBool(String key, bool value) async {
    sharedPreference.setBool(key, value);
    sharedPreference.reload();
  }

  Future<String?> get(String key) async {
    return sharedPreference.getString(key);
  }

  bool? getBool(String key) {
    return sharedPreference.getBool(key);
  }

  Future<int?> getInt(String key) async {
    return sharedPreference.getInt(key);
  }

  Future<bool> removeValue(String key) async {
    return sharedPreference.remove(key);
  }

  Future<bool> setToken(String value) {
    return sharedPreference.setString(AppConstants.token, value);
  }

  Future<bool> removeToken() => sharedPreference.remove(AppConstants.token);

  Future<String?> getToken() async => await get(AppConstants.token);

  Future<void> clear() async {
    sharedPreference.clear();
  }
}
