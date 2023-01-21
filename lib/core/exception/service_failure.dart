import 'package:astronomy/core/exception/failure.exception.dart';

class ServiceFailure extends Failure {
  ServiceFailure({required String message}) : super(message: message);
}

class DeniedPermissionFailure extends Failure {
  DeniedPermissionFailure({required String message}) : super(message: message);
}
