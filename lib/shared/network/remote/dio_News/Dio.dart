import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
   static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://disease.sh/v3/covid-19/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response> getData(
      {
        required String? url,
      Map<String, dynamic>? query,
      //String lang = 'en',
      String? token}) async {
    // dio.options.headers = {
    //   'lang': lang,
    //   'Content-Type': 'application/json',
    //   //'Authorization': token ?? ''
    // };

    return await dio.get(
      url!,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {@required String? url,
      Map<String, dynamic>? query,
        Map<String, dynamic>? data,
      String lang = 'en',
      String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.post(url!, data: data, queryParameters: query);
  }

  static Future<Response> putData(
      {@required String? url,
        Map<String, dynamic>? query,
        Map<String, dynamic>? data,
        String lang = 'en',
        String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return dio.put(url!, data: data, queryParameters: query);
  }
}

// -{https://student.valuxapps.com/api/
