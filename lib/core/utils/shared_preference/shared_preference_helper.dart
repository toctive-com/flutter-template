import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/constants/app_constants.dart';

/// [SharedPreferencesHelper] is a class that handle shared preference
class SharedPreferencesHelper {
  /// [SharedPreferencesHelper] constructor
  SharedPreferencesHelper({required this.sharedPreference});

  /// [SharedPreferences] instance
  final SharedPreferences sharedPreference;

  /// set value to shared preference
  Future<bool> set(String key, String value) {
    return sharedPreference.setString(key, value);
  }

  /// set value to shared preference
  Future<void> setInt(String key, int value) async {
    await sharedPreference.setInt(key, value);
    await sharedPreference.reload();
  }

  /// set value to shared preference
  Future<void> setBool({required String key, required bool value}) async {
    await sharedPreference.setBool(key, value);
    await sharedPreference.reload();
  }

  /// get value from shared preference
  Future<String?> get(String key) async {
    return sharedPreference.getString(key);
  }

  /// get value from shared preference
  bool? getBool(String key) {
    return sharedPreference.getBool(key);
  }

  /// get value from shared preference
  Future<int?> getInt(String key) async {
    return sharedPreference.getInt(key);
  }

  /// get value from shared preference
  Future<bool> removeValue(String key) async {
    return sharedPreference.remove(key);
  }

  /// get value from shared preference
  Future<bool> setToken(String value) {
    return sharedPreference.setString(AppConstants.token, value);
  }

  /// get value from shared preference
  Future<bool> removeToken() => sharedPreference.remove(AppConstants.token);

  /// get value from shared preference
  Future<String?> getToken() async => get(AppConstants.token);

  /// get value from shared preference
  Future<void> clear() async {
    await sharedPreference.clear();
  }
}
