import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class CommonSP{

  static void saveDBPath(String json) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password_db_path', json);
  }

  static Future<String> getDBPath() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var json =prefs.getString('password_db_path');
    return json;
  }

  static void saveEmail(String json) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', json);
  }

  static Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var json = prefs.getString('email');
    return json;
  }
}