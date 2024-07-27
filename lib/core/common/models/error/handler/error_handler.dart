import 'package:network_implementation/network_implementation.dart';
import '../exceptions/connection_error_exception.dart';
import '../exceptions/connection_timeout_exception.dart';
import '../exceptions/general_exception.dart';
import '../exceptions/receive_timeout_exception.dart';
import '../exceptions/send_timeout_exception.dart';
import '../exceptions/server_error_exception.dart';
import '../exceptions/un_authorized_token_exception.dart';
import 'exception_enum.dart';

class ErrorHandler {
  ErrorHandler();

  factory ErrorHandler.exception(ExceptionEnum exceptionEnum, Exception exception) {
    switch (exceptionEnum) {
      case ExceptionEnum.generalException:
        return GeneralException(ExceptionEnum.generalException.value);
      case ExceptionEnum.unAuthorized:
        return UnAuthorizedTokenException(exception as DioException);
      case ExceptionEnum.serverError:
        return ServerErrorException();
      case ExceptionEnum.connectionErrorException:
        return ConnectionErrorException();
      case ExceptionEnum.connectionTimeOutException:
        return ConnectionTimeoutException();
      case ExceptionEnum.sendTimeoutException:
        return SendTimeoutException();
      case ExceptionEnum.receiveTimeoutException:
        return ReceiveTimeoutException();
      case ExceptionEnum.LO_IUP_1002:
        return GeneralException(ExceptionEnum.generalException.value);
    // return WrongEmailPasswordException();
      case ExceptionEnum.FE_DNE_1002:
        return GeneralException(ExceptionEnum.generalException.value);
    // return FileNotFoundException();
      case ExceptionEnum.FE_FD_1001:
        return GeneralException(ExceptionEnum.generalException.value);
    // return FileDeletionFailedException();
      case ExceptionEnum.T_DNE_1001:
        return GeneralException(ExceptionEnum.generalException.value);
    // return UnAvailableTaskException();
      case ExceptionEnum.T_DNA_1002:
        return GeneralException(ExceptionEnum.generalException.value);
    // return NotValidTaskException();
      ///==========

      case ExceptionEnum.cancelException:
      case ExceptionEnum.badResponseException:
      case ExceptionEnum.badCertificateResponseException:
      case ExceptionEnum.unknownException:
      case ExceptionEnum.formatException:
      case ExceptionEnum.docTypeHtmlException:
      default:
        return GeneralException(exceptionEnum.value);
    }
  }
}
