import 'dart:convert';

import 'package:cook_app/core/network/remote/api_constance.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstance.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String? token}) async {
    dio.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    Response response =
        await dio.post(endPoint, data: data, queryParameters: query);
    return response;
  }

  Future<Response> getData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    Response response = await dio.get(endPoint);
    return response;
  }

  static Future<Response> puttData(
      {required String endPoint,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String? token}) async {
    dio.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    Response response =
        await dio.put(endPoint, data: data, queryParameters: query);
    return response;
  }

//***********************HTTP CODE********************************* */
  static Future<http.Response> postDataHttp(
      {required String endPoint,
      required Map<String, dynamic> data,
      String? token}) async {
    final String baseUrl = '${ApiConstance.baseUrl}$endPoint';

    final http.Response response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        },
        body: json.encode(data));
    return response;
  }
}
