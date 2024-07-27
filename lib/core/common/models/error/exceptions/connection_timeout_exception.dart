
import '../handler/error_handler.dart';

class ConnectionTimeoutException extends ErrorHandler {
  @override
  String toString() {
    // return ExceptionEnum.connectionTimeOutException.value;
    return 'انتهاء مهلة الاتصال';
  }
}
