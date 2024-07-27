import 'dart:async';
import 'dart:io';
import 'package:app_fundamentals/app_fundamentals.dart';
import 'package:network_implementation/network_implementation.dart';
import 'dio_exception_handler.dart';
import 'error_handler.dart';
import 'exception_enum.dart';

class ErrorModel implements BaseModel {
  String? message;

  ErrorModel({this.message});

  factory ErrorModel.fromJson(dynamic exception) {

    ExceptionEnum exceptionEnum = ExceptionEnum.unknownException;
    switch (exception.runtimeType) {
      case DioException:
        exceptionEnum = DioExceptionHandler().handleException(exception);
        break;
      case SocketException:
        exceptionEnum = ExceptionEnum.connectionErrorException;
        break;
      case FormatException:
        exceptionEnum = ExceptionEnum.formatException;
        break;
      case TimeoutException:
        exceptionEnum = ExceptionEnum.connectionTimeOutException;
        break;
      case HttpException:
        exceptionEnum = ExceptionEnum.connectionErrorException;
        break;
      default:
        if (exception is String) {
          if (exception.startsWith('<!DOCTYPE html>')) {
            exceptionEnum = ExceptionEnum.docTypeHtmlException;
          } else {
            exceptionEnum = ExceptionEnum.generalException;
          }
        }
        break;
    }
    return ErrorModel(
      message: ErrorHandler.exception(exceptionEnum, exception).toString(),
    );
  }

  @override
  String toString() {
    return 'ErrorModel: $message';
  }
}
