import '../../core/core.dart';
import '../../domain/models/media.dart';

abstract class GridPageState {}

class InitialState implements GridPageState {
  const InitialState();
}

class LoadingState implements GridPageState {
  const LoadingState();
}

class ErrorState implements GridPageState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements GridPageState {
  final List<Media> mediaList;
  const SuccessState(this.mediaList);
}
