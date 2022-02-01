// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

  Data<E> success<E>(E value) {
    return Data<E>(
      value,
    );
  }

  ErrorDetails<E> error<E>([String? message]) {
    return ErrorDetails<E>(
      message,
    );
  }
}

/// @nodoc
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(E value) success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(E value)? success,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(E value)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data<E> value) success,
    required TResult Function(ErrorDetails<E> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Data<E> value)? success,
    TResult Function(ErrorDetails<E> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data<E> value)? success,
    TResult Function(ErrorDetails<E> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<E, $Res> {
  factory $ResultCopyWith(Result<E> value, $Res Function(Result<E>) then) =
      _$ResultCopyWithImpl<E, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<E, $Res> implements $ResultCopyWith<E, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<E> _value;
  // ignore: unused_field
  final $Res Function(Result<E>) _then;
}

/// @nodoc
abstract class $DataCopyWith<E, $Res> {
  factory $DataCopyWith(Data<E> value, $Res Function(Data<E>) then) =
      _$DataCopyWithImpl<E, $Res>;
  $Res call({E value});
}

/// @nodoc
class _$DataCopyWithImpl<E, $Res> extends _$ResultCopyWithImpl<E, $Res>
    implements $DataCopyWith<E, $Res> {
  _$DataCopyWithImpl(Data<E> _value, $Res Function(Data<E>) _then)
      : super(_value, (v) => _then(v as Data<E>));

  @override
  Data<E> get _value => super._value as Data<E>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Data<E>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$Data<E> with DiagnosticableTreeMixin implements Data<E> {
  const _$Data(this.value);

  @override
  final E value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$E>.success(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$E>.success'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Data<E> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $DataCopyWith<E, Data<E>> get copyWith =>
      _$DataCopyWithImpl<E, Data<E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(E value) success,
    required TResult Function(String? message) error,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(E value)? success,
    TResult Function(String? message)? error,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(E value)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data<E> value) success,
    required TResult Function(ErrorDetails<E> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Data<E> value)? success,
    TResult Function(ErrorDetails<E> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data<E> value)? success,
    TResult Function(ErrorDetails<E> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Data<E> implements Result<E> {
  const factory Data(E value) = _$Data<E>;

  E get value;
  @JsonKey(ignore: true)
  $DataCopyWith<E, Data<E>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDetailsCopyWith<E, $Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails<E> value, $Res Function(ErrorDetails<E>) then) =
      _$ErrorDetailsCopyWithImpl<E, $Res>;
  $Res call({String? message});
}

/// @nodoc
class _$ErrorDetailsCopyWithImpl<E, $Res> extends _$ResultCopyWithImpl<E, $Res>
    implements $ErrorDetailsCopyWith<E, $Res> {
  _$ErrorDetailsCopyWithImpl(
      ErrorDetails<E> _value, $Res Function(ErrorDetails<E>) _then)
      : super(_value, (v) => _then(v as ErrorDetails<E>));

  @override
  ErrorDetails<E> get _value => super._value as ErrorDetails<E>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ErrorDetails<E>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorDetails<E>
    with DiagnosticableTreeMixin
    implements ErrorDetails<E> {
  const _$ErrorDetails([this.message]);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$E>.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$E>.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorDetails<E> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $ErrorDetailsCopyWith<E, ErrorDetails<E>> get copyWith =>
      _$ErrorDetailsCopyWithImpl<E, ErrorDetails<E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(E value) success,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(E value)? success,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(E value)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data<E> value) success,
    required TResult Function(ErrorDetails<E> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Data<E> value)? success,
    TResult Function(ErrorDetails<E> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data<E> value)? success,
    TResult Function(ErrorDetails<E> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails<E> implements Result<E> {
  const factory ErrorDetails([String? message]) = _$ErrorDetails<E>;

  String? get message;
  @JsonKey(ignore: true)
  $ErrorDetailsCopyWith<E, ErrorDetails<E>> get copyWith =>
      throw _privateConstructorUsedError;
}
