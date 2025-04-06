import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;

//! Here The Initialize of cache .
  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? getDataString({required String key}) {
    return _sharedPreferences.getString(key);
  }

//! this method to put data in local database using key

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    }

    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    } else {
      return await _sharedPreferences.setDouble(key, value);
    }
  }

//! this method to get data already saved in local database

  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

//! remove data using specific key

  static Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

//! this method to check if local database contains {key}
  static bool containsKey({required String key}) {
    return _sharedPreferences.containsKey(key);
  }

  static Future<bool> clearData({required String key}) async {
    return _sharedPreferences.clear();
  }

//! this fun to put data in local data base using key
  static Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    } else {
      return await _sharedPreferences.setInt(key, value);
    }
  }

  // setSecureData with FlutterSecureStorage
  // setSecureData(String key, dynamic val) async {
  //   final storage = new FlutterSecureStorage();
  //   await storage.write(key: key, value: val);
  // }

  // getSecureData(String key) async {
  //   final storage = new FlutterSecureStorage();
  //   return await storage.read(key: key);
  // }
}
