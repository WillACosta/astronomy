import 'failure.exception.dart';

class ServerFailure extends Failure {
  ServerFailure({
    required String message,
    Object? error,
  }) : super(
          message: message,
          error: error,
        );
}
