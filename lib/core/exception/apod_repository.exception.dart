import 'package:astronomy/core/exception/failure.exception.dart';

class ApodRepositoryException extends Failure {
  ApodRepositoryException({required String message}) : super(message: message);
}
