import 'package:astronomy/core/failures/failure.exception.dart';

class ServiceFailure extends Failure {
  const ServiceFailure([String? message]) : super(message: message);

  @override
  List<Object?> get props => [];
}

class DeniedPermissionFailure extends Failure {
  const DeniedPermissionFailure([String? message]) : super(message: message);

  @override
  List<Object?> get props => [];
}
