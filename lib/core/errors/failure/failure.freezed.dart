// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpected,
    required TResult Function() deniedPermission,
    required TResult Function() unexpectedDateFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unexpected,
    TResult? Function()? deniedPermission,
    TResult? Function()? unexpectedDateFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? deniedPermission,
    TResult Function()? unexpectedDateFormat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_DeniedPermission value) deniedPermission,
    required TResult Function(_UnexpectedDateFormatFailure value)
        unexpectedDateFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_DeniedPermission value)? deniedPermission,
    TResult? Function(_UnexpectedDateFormatFailure value)? unexpectedDateFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_DeniedPermission value)? deniedPermission,
    TResult Function(_UnexpectedDateFormatFailure value)? unexpectedDateFormat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UnexpectedCopyWith<$Res> {
  factory _$$_UnexpectedCopyWith(
          _$_Unexpected value, $Res Function(_$_Unexpected) then) =
      __$$_UnexpectedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_UnexpectedCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_Unexpected>
    implements _$$_UnexpectedCopyWith<$Res> {
  __$$_UnexpectedCopyWithImpl(
      _$_Unexpected _value, $Res Function(_$_Unexpected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Unexpected(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.unexpected(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unexpected &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnexpectedCopyWith<_$_Unexpected> get copyWith =>
      __$$_UnexpectedCopyWithImpl<_$_Unexpected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpected,
    required TResult Function() deniedPermission,
    required TResult Function() unexpectedDateFormat,
  }) {
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unexpected,
    TResult? Function()? deniedPermission,
    TResult? Function()? unexpectedDateFormat,
  }) {
    return unexpected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? deniedPermission,
    TResult Function()? unexpectedDateFormat,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_DeniedPermission value) deniedPermission,
    required TResult Function(_UnexpectedDateFormatFailure value)
        unexpectedDateFormat,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_DeniedPermission value)? deniedPermission,
    TResult? Function(_UnexpectedDateFormatFailure value)? unexpectedDateFormat,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_DeniedPermission value)? deniedPermission,
    TResult Function(_UnexpectedDateFormatFailure value)? unexpectedDateFormat,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements Failure {
  const factory _Unexpected([final String? message]) = _$_Unexpected;

  String? get message;
  @JsonKey(ignore: true)
  _$$_UnexpectedCopyWith<_$_Unexpected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeniedPermissionCopyWith<$Res> {
  factory _$$_DeniedPermissionCopyWith(
          _$_DeniedPermission value, $Res Function(_$_DeniedPermission) then) =
      __$$_DeniedPermissionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeniedPermissionCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_DeniedPermission>
    implements _$$_DeniedPermissionCopyWith<$Res> {
  __$$_DeniedPermissionCopyWithImpl(
      _$_DeniedPermission _value, $Res Function(_$_DeniedPermission) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeniedPermission implements _DeniedPermission {
  const _$_DeniedPermission();

  @override
  String toString() {
    return 'Failure.deniedPermission()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeniedPermission);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpected,
    required TResult Function() deniedPermission,
    required TResult Function() unexpectedDateFormat,
  }) {
    return deniedPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unexpected,
    TResult? Function()? deniedPermission,
    TResult? Function()? unexpectedDateFormat,
  }) {
    return deniedPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? deniedPermission,
    TResult Function()? unexpectedDateFormat,
    required TResult orElse(),
  }) {
    if (deniedPermission != null) {
      return deniedPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_DeniedPermission value) deniedPermission,
    required TResult Function(_UnexpectedDateFormatFailure value)
        unexpectedDateFormat,
  }) {
    return deniedPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_DeniedPermission value)? deniedPermission,
    TResult? Function(_UnexpectedDateFormatFailure value)? unexpectedDateFormat,
  }) {
    return deniedPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_DeniedPermission value)? deniedPermission,
    TResult Function(_UnexpectedDateFormatFailure value)? unexpectedDateFormat,
    required TResult orElse(),
  }) {
    if (deniedPermission != null) {
      return deniedPermission(this);
    }
    return orElse();
  }
}

abstract class _DeniedPermission implements Failure {
  const factory _DeniedPermission() = _$_DeniedPermission;
}

/// @nodoc
abstract class _$$_UnexpectedDateFormatFailureCopyWith<$Res> {
  factory _$$_UnexpectedDateFormatFailureCopyWith(
          _$_UnexpectedDateFormatFailure value,
          $Res Function(_$_UnexpectedDateFormatFailure) then) =
      __$$_UnexpectedDateFormatFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnexpectedDateFormatFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_UnexpectedDateFormatFailure>
    implements _$$_UnexpectedDateFormatFailureCopyWith<$Res> {
  __$$_UnexpectedDateFormatFailureCopyWithImpl(
      _$_UnexpectedDateFormatFailure _value,
      $Res Function(_$_UnexpectedDateFormatFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UnexpectedDateFormatFailure implements _UnexpectedDateFormatFailure {
  const _$_UnexpectedDateFormatFailure();

  @override
  String toString() {
    return 'Failure.unexpectedDateFormat()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnexpectedDateFormatFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpected,
    required TResult Function() deniedPermission,
    required TResult Function() unexpectedDateFormat,
  }) {
    return unexpectedDateFormat();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unexpected,
    TResult? Function()? deniedPermission,
    TResult? Function()? unexpectedDateFormat,
  }) {
    return unexpectedDateFormat?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? deniedPermission,
    TResult Function()? unexpectedDateFormat,
    required TResult orElse(),
  }) {
    if (unexpectedDateFormat != null) {
      return unexpectedDateFormat();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_DeniedPermission value) deniedPermission,
    required TResult Function(_UnexpectedDateFormatFailure value)
        unexpectedDateFormat,
  }) {
    return unexpectedDateFormat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_DeniedPermission value)? deniedPermission,
    TResult? Function(_UnexpectedDateFormatFailure value)? unexpectedDateFormat,
  }) {
    return unexpectedDateFormat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_DeniedPermission value)? deniedPermission,
    TResult Function(_UnexpectedDateFormatFailure value)? unexpectedDateFormat,
    required TResult orElse(),
  }) {
    if (unexpectedDateFormat != null) {
      return unexpectedDateFormat(this);
    }
    return orElse();
  }
}

abstract class _UnexpectedDateFormatFailure implements Failure {
  const factory _UnexpectedDateFormatFailure() = _$_UnexpectedDateFormatFailure;
}
