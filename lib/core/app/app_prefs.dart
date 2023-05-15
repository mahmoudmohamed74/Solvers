// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_IS_CLIENT_LOGGED_IN = "PREFS_KEY_IS_CLIENT_LOGGED_IN";
const String PREFS_KEY_IS_TECHNICIAN_LOGGED_IN =
    "PREFS_KEY_IS_TECHNICIAN_LOGGED_IN";
const String PREFS_KEY_CLIENT_ID = "PREFS_KEY_CLIENT_ID";
const String PREFS_KEY_TECHNICIAN_ID = "PREFS_KEY_TECHNICIAN_ID";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<void> setIsClientLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_CLIENT_LOGGED_IN, true);
  }

  Future<bool> isClientLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_CLIENT_LOGGED_IN) ?? false;
  }

  Future<void> saveClientId(String id) async {
    _sharedPreferences.setString(PREFS_KEY_CLIENT_ID, id);
  }

  Future<String?> getClientId() async {
    return _sharedPreferences.getString(PREFS_KEY_CLIENT_ID);
  }

  Future<void> setIsTechnicianLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_TECHNICIAN_LOGGED_IN, true);
  }

  Future<bool> isTechnicianLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_TECHNICIAN_LOGGED_IN) ??
        false;
  }

  Future<void> saveTechnicianId(String id) async {
    _sharedPreferences.setString(PREFS_KEY_TECHNICIAN_ID, id);
  }

  Future<String?> getTechnicianId() async {
    return _sharedPreferences.getString(PREFS_KEY_TECHNICIAN_ID);
  }

  Future<void> logoutTech() async {
    _sharedPreferences.remove(PREFS_KEY_IS_TECHNICIAN_LOGGED_IN);
    _sharedPreferences.remove(PREFS_KEY_TECHNICIAN_ID);
  }

  Future<void> logoutClient() async {
    _sharedPreferences.remove(PREFS_KEY_IS_CLIENT_LOGGED_IN);
    _sharedPreferences.remove(PREFS_KEY_CLIENT_ID);
  }

  void clearCache() {
    _sharedPreferences.clear();
  }

  // Future<bool> removeData({
  //   // user id TODO
  //   required String key,
  // }) async {
  //   return await _sharedPreferences.remove(key);
  // }
}
