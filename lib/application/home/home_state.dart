import 'package:astronomy/core/failures/failure.exception.dart';
import 'package:astronomy/domain/models/media.dart';

abstract class HomeState {}

class InitialState implements HomeState {
  const InitialState();
}

class LoadingState implements HomeState {
  const LoadingState();
}

class ErrorState implements HomeState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements HomeState {
  final Media media;
  const SuccessState(this.media);
}
