import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../shared/const/api_consts.dart';

class DioHelper {
  static BaseOptions opts = BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true,
    followRedirects: false,
    validateStatus: (status) {
      return status! <= 500;
    },
  );

  static Dio init() => Dio(opts);

  static Dio? dio = init();

  static Future<Response?> postData(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      Response? response = await dio?.post(url, data: data);
      if (kDebugMode) {
        print(response);
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e is DioException ? e.response : null;
    }
  }

  static Future<Response?> getData(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      Response? response =
          await dio?.get(url, queryParameters: queryParameters);
      if (kDebugMode) {
        print(response);
      }
      return response;
    } catch (e) {
      return e is DioException ? e.response : null;
    }
  }
}
