import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final Object? error;

  const Failure({required this.message, this.error});
}
