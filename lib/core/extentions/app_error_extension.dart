import 'package:flutter/material.dart';
import 'package:unit_one_weather/core/data/error/app_exception.dart';
import 'package:unit_one_weather/core/data/error/server_exception_type.dart';

extension AppErrorExtension on AppException {
  String errorMessage(BuildContext context) {
    return map(serverException: (ex) => ex.serverErrorMessage(context));
  }
}

extension ServerErrorExtension on ServerException {
  String serverErrorMessage(BuildContext context) {
    switch (type) {
      case ServerExceptionType.unknown:
        return 'Unknown Error';
      case ServerExceptionType.general:
        return message; //Business logic error message from the backend
      case ServerExceptionType.notFound:
        return 'Not Found';
      case ServerExceptionType.internal:
        return 'Internal Error';
      case ServerExceptionType.serviceUnavailable:
        return 'Service Unavailable';
      case ServerExceptionType.timeOut:
        return 'Timeout';
      case ServerExceptionType.noInternet:
        return 'Check your Internet';
    }
  }
}
