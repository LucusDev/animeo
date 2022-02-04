// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_player_panel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomVideoControllerTypeTearOff {
  const _$CustomVideoControllerTypeTearOff();

  _Online online(FijkPlayer controller) {
    return _Online(
      controller,
    );
  }

  _Offline offline(VideoPlayerController controller) {
    return _Offline(
      controller,
    );
  }
}

/// @nodoc
const $CustomVideoControllerType = _$CustomVideoControllerTypeTearOff();

/// @nodoc
mixin _$CustomVideoControllerType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FijkPlayer controller) online,
    required TResult Function(VideoPlayerController controller) offline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FijkPlayer controller)? online,
    TResult Function(VideoPlayerController controller)? offline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FijkPlayer controller)? online,
    TResult Function(VideoPlayerController controller)? offline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Online value) online,
    required TResult Function(_Offline value) offline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Online value)? online,
    TResult Function(_Offline value)? offline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Online value)? online,
    TResult Function(_Offline value)? offline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomVideoControllerTypeCopyWith<$Res> {
  factory $CustomVideoControllerTypeCopyWith(CustomVideoControllerType value,
          $Res Function(CustomVideoControllerType) then) =
      _$CustomVideoControllerTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$CustomVideoControllerTypeCopyWithImpl<$Res>
    implements $CustomVideoControllerTypeCopyWith<$Res> {
  _$CustomVideoControllerTypeCopyWithImpl(this._value, this._then);

  final CustomVideoControllerType _value;
  // ignore: unused_field
  final $Res Function(CustomVideoControllerType) _then;
}

/// @nodoc
abstract class _$OnlineCopyWith<$Res> {
  factory _$OnlineCopyWith(_Online value, $Res Function(_Online) then) =
      __$OnlineCopyWithImpl<$Res>;
  $Res call({FijkPlayer controller});
}

/// @nodoc
class __$OnlineCopyWithImpl<$Res>
    extends _$CustomVideoControllerTypeCopyWithImpl<$Res>
    implements _$OnlineCopyWith<$Res> {
  __$OnlineCopyWithImpl(_Online _value, $Res Function(_Online) _then)
      : super(_value, (v) => _then(v as _Online));

  @override
  _Online get _value => super._value as _Online;

  @override
  $Res call({
    Object? controller = freezed,
  }) {
    return _then(_Online(
      controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as FijkPlayer,
    ));
  }
}

/// @nodoc

class _$_Online implements _Online {
  const _$_Online(this.controller);

  @override
  final FijkPlayer controller;

  @override
  String toString() {
    return 'CustomVideoControllerType.online(controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Online &&
            const DeepCollectionEquality()
                .equals(other.controller, controller));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(controller));

  @JsonKey(ignore: true)
  @override
  _$OnlineCopyWith<_Online> get copyWith =>
      __$OnlineCopyWithImpl<_Online>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FijkPlayer controller) online,
    required TResult Function(VideoPlayerController controller) offline,
  }) {
    return online(controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FijkPlayer controller)? online,
    TResult Function(VideoPlayerController controller)? offline,
  }) {
    return online?.call(controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FijkPlayer controller)? online,
    TResult Function(VideoPlayerController controller)? offline,
    required TResult orElse(),
  }) {
    if (online != null) {
      return online(controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Online value) online,
    required TResult Function(_Offline value) offline,
  }) {
    return online(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Online value)? online,
    TResult Function(_Offline value)? offline,
  }) {
    return online?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Online value)? online,
    TResult Function(_Offline value)? offline,
    required TResult orElse(),
  }) {
    if (online != null) {
      return online(this);
    }
    return orElse();
  }
}

abstract class _Online implements CustomVideoControllerType {
  const factory _Online(FijkPlayer controller) = _$_Online;

  FijkPlayer get controller;
  @JsonKey(ignore: true)
  _$OnlineCopyWith<_Online> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OfflineCopyWith<$Res> {
  factory _$OfflineCopyWith(_Offline value, $Res Function(_Offline) then) =
      __$OfflineCopyWithImpl<$Res>;
  $Res call({VideoPlayerController controller});
}

/// @nodoc
class __$OfflineCopyWithImpl<$Res>
    extends _$CustomVideoControllerTypeCopyWithImpl<$Res>
    implements _$OfflineCopyWith<$Res> {
  __$OfflineCopyWithImpl(_Offline _value, $Res Function(_Offline) _then)
      : super(_value, (v) => _then(v as _Offline));

  @override
  _Offline get _value => super._value as _Offline;

  @override
  $Res call({
    Object? controller = freezed,
  }) {
    return _then(_Offline(
      controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
    ));
  }
}

/// @nodoc

class _$_Offline implements _Offline {
  const _$_Offline(this.controller);

  @override
  final VideoPlayerController controller;

  @override
  String toString() {
    return 'CustomVideoControllerType.offline(controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Offline &&
            const DeepCollectionEquality()
                .equals(other.controller, controller));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(controller));

  @JsonKey(ignore: true)
  @override
  _$OfflineCopyWith<_Offline> get copyWith =>
      __$OfflineCopyWithImpl<_Offline>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FijkPlayer controller) online,
    required TResult Function(VideoPlayerController controller) offline,
  }) {
    return offline(controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FijkPlayer controller)? online,
    TResult Function(VideoPlayerController controller)? offline,
  }) {
    return offline?.call(controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FijkPlayer controller)? online,
    TResult Function(VideoPlayerController controller)? offline,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline(controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Online value) online,
    required TResult Function(_Offline value) offline,
  }) {
    return offline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Online value)? online,
    TResult Function(_Offline value)? offline,
  }) {
    return offline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Online value)? online,
    TResult Function(_Offline value)? offline,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline(this);
    }
    return orElse();
  }
}

abstract class _Offline implements CustomVideoControllerType {
  const factory _Offline(VideoPlayerController controller) = _$_Offline;

  VideoPlayerController get controller;
  @JsonKey(ignore: true)
  _$OfflineCopyWith<_Offline> get copyWith =>
      throw _privateConstructorUsedError;
}
