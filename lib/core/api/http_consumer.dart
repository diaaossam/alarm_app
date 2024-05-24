import 'package:dio/dio.dart';
import 'package:alarm_app/config/environment/environment_helper.dart';
import 'package:alarm_app/core/error/exceptions.dart';

import 'status_code.dart';

class MapClientConsumer {

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Dio client = Dio(BaseOptions(
        baseUrl: Environment.mapUrl,
      ));

      final response = await client.get(path, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        _handleDioErrorByStatusCode(response.statusCode ?? 0, response.data['message']);
      }
    } on DioError catch (error) {
      _handleDioError(error);
    }
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
        throw const NotFoundException();
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
