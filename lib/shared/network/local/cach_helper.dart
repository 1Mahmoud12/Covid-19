


import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{

  static Future putData({required String key,required String value})async
  {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

  static dynamic get( key)async
  {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

}

