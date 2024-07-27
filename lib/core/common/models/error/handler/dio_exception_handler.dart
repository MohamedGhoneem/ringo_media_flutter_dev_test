
import 'package:dio/dio.dart';

import 'exception_enum.dart';

class DioExceptionHandler {
  ExceptionEnum handleException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionError:
        return ExceptionEnum.connectionErrorException;
      case DioExceptionType.connectionTimeout:
        return ExceptionEnum.connectionTimeOutException;
      case DioExceptionType.sendTimeout:
        return ExceptionEnum.sendTimeoutException;
      case DioExceptionType.receiveTimeout:
        return ExceptionEnum.receiveTimeoutException;
      case DioExceptionType.cancel:
        return ExceptionEnum.cancelException;
      case DioExceptionType.badResponse:
        if (exception.response?.statusCode == 401) {
          return ExceptionEnum.unAuthorized;
        } else if (exception.response?.statusCode == 403) {
          return ExceptionEnum.connectionErrorException;
        } else if (exception.response?.statusCode == 500) {
          return ExceptionEnum.serverError;
        } else if (exception.response != null &&
            exception.response?.data != null &&
            exception.response?.data['errors'] != null &&
            exception.response?.data['errors'] != []) {
          return ExceptionEnum.fromValue(
            exception.response?.data['errors'][0]['errorCode'],
          );
        } else {
          return ExceptionEnum.badResponseException;
        }

      case DioExceptionType.badCertificate:
        return ExceptionEnum.badCertificateResponseException;
      case DioExceptionType.unknown:
        return ExceptionEnum.unknownException;
      default:
        return ExceptionEnum.unknownException;
    }
  }
}
