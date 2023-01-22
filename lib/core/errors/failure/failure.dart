import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.unexpected([String? message]) = _Unexpected;
  const factory Failure.deniedPermission() = _DeniedPermission;
  const factory Failure.unexpectedDateFormat() = _UnexpectedDateFormatFailure;
}
