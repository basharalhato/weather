import 'dart:io';

import 'package:dio/dio.dart';
import 'package:unit_one_weather/core/data/error/app_exception.dart';
import 'package:unit_one_weather/core/data/error/server_exception_type.dart';

extension MapErrorExtension on Exception {
  ServerException mapErrorToServerException() {
    final error = this;

    if (error is DioException) {
      return error.dioToServerException();
    }

    return ServerException(
      type: ServerExceptionType.unknown,
      message: error.toString(),
    );
  }
}

extension _DioErrorExtension on DioException {
  ServerException dioToServerException() {
    final statusCode = response?.statusCode;

    switch (type) {
      case DioExceptionType.badResponse:
        switch (statusCode) {
          //400 is our business logic errors code.
          //It's handled by error interceptors of each API.
          case 400:
            return ServerException(
              type: ServerExceptionType.general,
              message: message.toString(),
              code: statusCode,
            );
          case 404:
          case 405:
          case 501:
            return ServerException(
              type: ServerExceptionType.notFound,
              message: message.toString(),
              code: statusCode,
            );
          case 500:
          case 502:
            return ServerException(
              type: ServerExceptionType.internal,
              message: message.toString(),
              code: statusCode,
            );
          case 503:
            return ServerException(
              type: ServerExceptionType.serviceUnavailable,
              message: message.toString(),
              code: statusCode,
            );
          default:
            return ServerException(
              type: ServerExceptionType.unknown,
              message: message.toString(),
              code: statusCode,
            );
        }

      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerException(
          type: ServerExceptionType.timeOut,
          message: message.toString(),
          code: 408,
        );

      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        if (error is SocketException) {
          return ServerException(
            type: ServerExceptionType.noInternet,
            message: message.toString(),
            code: 101,
          );
        } else {
          return ServerException(
            type: ServerExceptionType.unknown,
            message: message.toString(),
            code: statusCode,
          );
        }
    }
  }
}
