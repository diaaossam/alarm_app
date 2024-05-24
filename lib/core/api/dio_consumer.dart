import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:alarm_app/config/environment/environment_helper.dart';
import 'package:alarm_app/core/api/status_code.dart';
import 'package:alarm_app/core/error/exceptions.dart';
import 'package:alarm_app/core/utils/api_config.dart';
import 'package:alarm_app/core/utils/app_strings.dart';

class DioConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      ..baseUrl = Environment.apiUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..headers = {
        "Authorization": "Bearer ${ApiConfig.userToken}",
        AppStrings.acceptLanguage: ApiConfig.langCode,
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.accept: AppStrings.applicationJson,
      }
      ..validateStatus = (status) {
        return status! < ApiConfigData.internalServerError;
      };
    if (kDebugMode) {
      //client.interceptors.add(auth_di.sl<LogInterceptor>());
    }
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return _handleResponseAsJson(response);
      } else {
        _handleDioErrorByStatusCode(response.statusCode ?? 0, _handleResponseAsJson(response)['message']);
      }
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }



  Future<dynamic> post(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      if (response.statusCode == 200) {
        return _handleResponseAsJson(response);
      } else {
        var mm = _handleResponseAsJson(response);
        String message = mm['message'];
        _handleDioErrorByStatusCode(response.statusCode ?? 0, message);
      }
    } on DioError catch (error) {
      print(error.response);
      _handleDioError(error);
    }
  }


  Future<dynamic> put(String path,
      {Map<String, dynamic>? body,
        bool formDataIsEnabled = false,
        Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.put(path,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      if (response.statusCode == 200) {
        return _handleResponseAsJson(response);
      } else {
        var mm = _handleResponseAsJson(response);
        String message = mm['message'];
        _handleDioErrorByStatusCode(response.statusCode ?? 0, message);
      }
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }



  Future<dynamic> delete(String path,
      {Map<String, dynamic>? body,
        bool formDataIsEnabled = false,
        Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.delete(path,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      if (response.statusCode == 200) {
        return _handleResponseAsJson(response);
      } else {
        var mm = _handleResponseAsJson(response);
        String message = mm['message'];
        _handleDioErrorByStatusCode(response.statusCode ?? 0, message);
      }
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ApiConfigData.badRequest:
            throw const BadRequestException();
          case ApiConfigData.unauthorized:
          case ApiConfigData.forbidden:
            throw const UnauthorizedException();
          case ApiConfigData.notFound:
            throw const NotFoundException();
          case ApiConfigData.conflict:
            throw const ConflictException();
          case ApiConfigData.internalServerError:
            throw const InternalServerErrorException();
          case ApiConfigData.badResponse:
            throw BadResponseException(error.response?.data['message']);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }

  dynamic _handleDioErrorByStatusCode(int statusCode, String message) {
    switch (statusCode) {
      case ApiConfigData.badRequest:
        throw const BadRequestException();
      case ApiConfigData.unauthorized:
      case ApiConfigData.forbidden:
        throw const UnauthorizedException();
      case ApiConfigData.notFound:
        throw NotFoundException(message);
      case ApiConfigData.conflict:
        throw const ConflictException();
      case ApiConfigData.internalServerError:
        throw const InternalServerErrorException();
      case ApiConfigData.badResponse:
        throw BadResponseException(message);
      default:
        throw const InternalServerErrorException();
    }
  }
}
