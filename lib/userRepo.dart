import 'dart:convert';

import 'package:shop_delivery/architecture/user_create/user_create_entity.dart';

import 'base/constants/PrefConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo {
  Future<bool> clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var u = prefs.getString(
      PrefConstant.USER,
    );
    if (u != null)
      return User.fromJson(await json.decode(u));
    else
      return null;
  }

  Future<bool> saveUser(User userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(PrefConstant.USER, json.encode(userData.toJson()));
  }

  Future<bool> url(url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('URL', url);
  }

  Future<bool> remurl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('URL');
  }

  Future<String> getotp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("URL");
  }
}
