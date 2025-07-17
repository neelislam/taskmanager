import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/data/models/user_model.dart';

class AuthController{
  static UserModel? userModel;
  static String? accessToken;



  static Future<void> saveUserData(UserModel model, Stream token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('User-data', jsonEncode(model.toJson()));
    await sharedPreferences.setString('token', token as String);
  userModel = model;
  accessToken = token as String?;

  }
  static Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     userModel = UserModel.fromJson(
         jsonDecode(sharedPreferences
             .getString('User-data')!));
     sharedPreferences.getString('token');
  }


  static Future<void> clearData() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
}


}