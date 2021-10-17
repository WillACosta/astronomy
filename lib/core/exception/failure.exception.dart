abstract class Failure implements Exception {
  final String message;
  final Object? error;

  Failure({required this.message, this.error});
}
