import 'dart:convert'; // For jsonEncode/jsonDecode
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/data/models/user_model.dart';
class AuthController {
  static UserModel? userModel;
  static String? accessToken;
  static const String _userDataKey = 'user-data';
  static const String _tokenKey = 'token';
  static Future<void> saveUserData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
    userModel = model;
    await sharedPreferences.setString(_tokenKey, token);
    accessToken = token;
  }
  static Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? userDataString = sharedPreferences.getString(_userDataKey);
    if (userDataString != null) {
      userModel = UserModel.fromJson(jsonDecode(userDataString));
    } else {
      userModel = null;
    }
    accessToken = sharedPreferences.getString(_tokenKey);
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    if (token != null) {
      await getUserData();
      return true;
    } else {
      return false;
    }
  }
  static Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    userModel = null;
    accessToken = null;
  }
}