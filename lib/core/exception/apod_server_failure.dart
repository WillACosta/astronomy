import 'failure.exception.dart';

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
}