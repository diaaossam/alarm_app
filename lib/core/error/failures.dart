import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:alarm_app/core/api/status_code.dart';

abstract class Failure extends Equatable {
  final String msg;

  const Failure({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.msg});

  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return const ServerFailure(msg: ApiConfigData.connectionTimeOut);
      case DioErrorType.response:
        return ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data);
      case DioErrorType.cancel:
        return const ServerFailure(msg: ApiConfigData.canceledRequest);
      case DioErrorType.other:
        return const ServerFailure(msg: ApiConfigData.unknownError);
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == ApiConfigData.notFound) {
      return const ServerFailure(
          msg: "your request was not found , please try later");
    } else if (statusCode == ApiConfigData.notFound) {
      return const ServerFailure(
          msg: "There is problem with server , please try later");
    } else if (statusCode == ApiConfigData.badRequest ||
        statusCode == ApiConfigData.unauthorized ||
        statusCode == ApiConfigData.forbidden) {
      return ServerFailure(msg: response["error"]['message']);
    } else {
      return const ServerFailure(msg: "There is Error , please try later");
    }
  }

  @override
  List<Object> get props => [msg];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.msg});

  @override
  List<Object> get props => [msg];
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.msg});

  @override
  List<Object> get props => [msg];
}
