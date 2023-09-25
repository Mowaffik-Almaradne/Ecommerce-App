import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences? sharedPreferences; // instance

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  // all data type can sasve
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else {
      return await sharedPreferences!.setDouble(key, value);
    }
  }

  static Future<bool> clearData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }

}



// static Future<bool> putData({
  //   required String key,
  //   required bool value,
  // }) async {
  //   return await sharedPreferences!.setBool(key, value);
  // }