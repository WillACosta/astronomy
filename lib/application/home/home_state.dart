import '../../core/exception/failure.exception.dart';
import '../../domain/entities/media.entity.dart';

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