import 'package:alarm_app/core/utils/api_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../utils/app_strings.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers = {AppStrings.accept: AppStrings.applicationJson};
    options.headers = {"Authorization": "Bearer ${ApiConfig.userToken}"};
    options.headers = {AppStrings.contentType: AppStrings.applicationJson};
    options.headers = {AppStrings.acceptLanguage: "ar"};
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
