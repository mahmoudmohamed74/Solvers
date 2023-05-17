// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_IS_CLIENT_LOGGED_IN = "PREFS_KEY_IS_CLIENT_LOGGED_IN";
const String PREFS_KEY_IS_TECHNICIAN_LOGGED_IN =
    "PREFS_KEY_IS_TECHNICIAN_LOGGED_IN";
const String PREFS_KEY_CLIENT_ID = "PREFS_KEY_CLIENT_ID";
const String PREFS_KEY_TECHNICIAN_ID = "PREFS_KEY_TECHNICIAN_ID";

class AppPreferences {
  SharedPreferences sharedPreferences;
  AppPreferences(this.sharedPreferences);

  Future<void> setIsClientLoggedIn() async {
    sharedPreferences.setBool(PREFS_KEY_IS_CLIENT_LOGGED_IN, true);
  }

  Future<bool> isClientLoggedIn() async {
    return sharedPreferences.getBool(PREFS_KEY_IS_CLIENT_LOGGED_IN) ?? false;
  }

  Future<void> saveClientId(String id) async {
    sharedPreferences.setString(PREFS_KEY_CLIENT_ID, id);
  }

  Future<String?> getClientId() async {
    return sharedPreferences.getString(PREFS_KEY_CLIENT_ID);
  }

  Future<void> setIsTechnicianLoggedIn() async {
    sharedPreferences.setBool(PREFS_KEY_IS_TECHNICIAN_LOGGED_IN, true);
  }

  Future<bool> isTechnicianLoggedIn() async {
    return sharedPreferences.getBool(PREFS_KEY_IS_TECHNICIAN_LOGGED_IN) ??
        false;
  }

  Future<void> saveTechnicianId(String id) async {
    sharedPreferences.setString(PREFS_KEY_TECHNICIAN_ID, id);
  }

  Future<String?> getTechnicianId() async {
    return sharedPreferences.getString(PREFS_KEY_TECHNICIAN_ID);
  }

  Future<void> logoutTech() async {
    sharedPreferences.remove(PREFS_KEY_IS_TECHNICIAN_LOGGED_IN);
    sharedPreferences.remove(PREFS_KEY_TECHNICIAN_ID);
  }

  Future<void> logoutClient() async {
    sharedPreferences.remove(PREFS_KEY_IS_CLIENT_LOGGED_IN);
    sharedPreferences.remove(PREFS_KEY_CLIENT_ID);
  }

  // Future<void> clean() async {
  //   sharedPreferences.clear();
  // }
}
