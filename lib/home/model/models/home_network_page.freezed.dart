// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_network_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeNetworkPageTearOff {
  const _$HomeNetworkPageTearOff();

  Recent recent(int pageNum) {
    return Recent(
      pageNum,
    );
  }

  Popular popular(int pageNum) {
    return Popular(
      pageNum,
    );
  }

  Seasonal seasonal(int pageNum, {Season? season, int? year}) {
    return Seasonal(
      pageNum,
      season: season,
      year: year,
    );
  }

  Genre genres(int pageNum, {Genres genre = Genres.action}) {
    return Genre(
      pageNum,
      genre: genre,
    );
  }
}

/// @nodoc
const $HomeNetworkPage = _$HomeNetworkPageTearOff();

/// @nodoc
mixin _$HomeNetworkPage {
  int get pageNum => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNum) recent,
    required TResult Function(int pageNum) popular,
    required TResult Function(int pageNum, Season? season, int? year) seasonal,
    required TResult Function(int pageNum, Genres genre) genres,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int pageNum)? recent,
    TResult Function(int pageNum)? popular,
    TResult Function(int pageNum, Season? season, int? year)? seasonal,
    TResult Function(int pageNum, Genres genre)? genres,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNum)? recent,
    TResult Function(int pageNum)? popular,
    TResult Function(int pageNum, Season? season, int? year)? seasonal,
    TResult Function(int pageNum, Genres genre)? genres,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Recent value) recent,
    required TResult Function(Popular value) popular,
    required TResult Function(Seasonal value) seasonal,
    required TResult Function(Genre value) genres,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Recent value)? recent,
    TResult Function(Popular value)? popular,
    TResult Function(Seasonal value)? seasonal,
    TResult Function(Genre value)? genres,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Recent value)? recent,
    TResult Function(Popular value)? popular,
    TResult Function(Seasonal value)? seasonal,
    TResult Function(Genre value)? genres,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeNetworkPageCopyWith<HomeNetworkPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeNetworkPageCopyWith<$Res> {
  factory $HomeNetworkPageCopyWith(
          HomeNetworkPage value, $Res Function(HomeNetworkPage) then) =
      _$HomeNetworkPageCopyWithImpl<$Res>;
  $Res call({int pageNum});
}

/// @nodoc
class _$HomeNetworkPageCopyWithImpl<$Res>
    implements $HomeNetworkPageCopyWith<$Res> {
  _$HomeNetworkPageCopyWithImpl(this._value, this._then);

  final HomeNetworkPage _value;
  // ignore: unused_field
  final $Res Function(HomeNetworkPage) _then;

  @override
  $Res call({
    Object? pageNum = freezed,
  }) {
    return _then(_value.copyWith(
      pageNum: pageNum == freezed
          ? _value.pageNum
          : pageNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class $RecentCopyWith<$Res> implements $HomeNetworkPageCopyWith<$Res> {
  factory $RecentCopyWith(Recent value, $Res Function(Recent) then) =
      _$RecentCopyWithImpl<$Res>;
  @override
  $Res call({int pageNum});
}

/// @nodoc
class _$RecentCopyWithImpl<$Res> extends _$HomeNetworkPageCopyWithImpl<$Res>
    implements $RecentCopyWith<$Res> {
  _$RecentCopyWithImpl(Recent _value, $Res Function(Recent) _then)
      : super(_value, (v) => _then(v as Recent));

  @override
  Recent get _value => super._value as Recent;

  @override
  $Res call({
    Object? pageNum = freezed,
  }) {
    return _then(Recent(
      pageNum == freezed
          ? _value.pageNum
          : pageNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Recent implements Recent {
  const _$Recent(this.pageNum);

  @override
  final int pageNum;

  @override
  String toString() {
    return 'HomeNetworkPage.recent(pageNum: $pageNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Recent &&
            const DeepCollectionEquality().equals(other.pageNum, pageNum));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(pageNum));

  @JsonKey(ignore: true)
  @override
  $RecentCopyWith<Recent> get copyWith =>
      _$RecentCopyWithImpl<Recent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNum) recent,
    required TResult Function(int pageNum) popular,
    required TResult Function(int pageNum, Season? season, int? year) seasonal,
    required TResult Function(int pageNum, Genres genre) genres,
  }) {
    return recent(pageNum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int pageNum)? recent,
    TResult Function(int pageNum)? popular,
    TResult Function(int pageNum, Season? season, int? year)? seasonal,
    TResult Function(int pageNum, Genres genre)? genres,
  }) {
    return recent?.call(pageNum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNum)? recent,
    TResult Function(int pageNum)? popular,
    TResult Function(int pageNum, Season? season, int? year)? seasonal,
    TResult Function(int pageNum, Genres genre)? genres,
    required TResult orElse(),
  }) {
    if (recent != null) {
      return recent(pageNum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Recent value) recent,
    required TResult Function(Popular value) popular,
    required TResult Function(Seasonal value) seasonal,
    required TResult Function(Genre value) genres,
  }) {
    return recent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Recent value)? recent,
    TResult Function(Popular value)? popular,
    TResult Function(Seasonal value)? seasonal,
    TResult Function(Genre value)? genres,
  }) {
    return recent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Recent value)? recent,
    TResult Function(Popular value)? popular,
    TResult Function(Seasonal value)? seasonal,
    TResult Function(Genre value)? genres,
    required TResult orElse(),
  }) {
    if (recent != null) {
      return recent(this);
    }
    return orElse();
  }
}

abstract class Recent implements HomeNetworkPage {
  const factory Recent(int pageNum) = _$Recent;

  @override
  int get pageNum;
  @override
  @JsonKey(ignore: true)
  $RecentCopyWith<Recent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularCopyWith<$Res>
    implements $HomeNetworkPageCopyWith<$Res> {
  factory $PopularCopyWith(Popular value, $Res Function(Popular) then) =
      _$PopularCopyWithImpl<$Res>;
  @override
  $Res call({int pageNum});
}

/// @nodoc
class _$PopularCopyWithImpl<$Res> extends _$HomeNetworkPageCopyWithImpl<$Res>
    implements $PopularCopyWith<$Res> {
  _$PopularCopyWithImpl(Popular _value, $Res Function(Popular) _then)
      : super(_value, (v) => _then(v as Popular));

  @override
  Popular get _value => super._value as Popular;

  @override
  $Res call({
    Object? pageNum = freezed,
  }) {
    return _then(Popular(
      pageNum == freezed
          ? _value.pageNum
          : pageNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Popular implements Popular {
  const _$Popular(this.pageNum);

  @override
  final int pageNum;

  @override
  String toString() {
    return 'HomeNetworkPage.popular(pageNum: $pageNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Popular &&
            const DeepCollectionEquality().equals(other.pageNum, pageNum));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(pageNum));

  @JsonKey(ignore: true)
  @override
  $PopularCopyWith<Popular> get copyWith =>
      _$PopularCopyWithImpl<Popular>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNum) recent,
    required TResult Function(int pageNum) popular,
    required TResult Function(int pageNum, Season? season, int? year) seasonal,
    required TResult Function(int pageNum, Genres genre) genres,
  }) {
    return popular(pageNum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int pageNum)? recent,
    TResult Function(int pageNum)? popular,
    TResult Function(int pageNum, Season? season, int? year)? seasonal,
    TResult Function(int pageNum, Genres genre)? genres,
  }) {
    return popular?.call(pageNum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNum)? recent,
    TResult Function(int pageNum)? popular,
    TResult Function(int pageNum, Season? season, int? year)? seasonal,
    TResult Function(int pageNum, Genres genre)? genres,
    required TResult orElse(),
  }) {
    if (popular != null) {
      return popular(pageNum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Recent value) recent,
    required TResult Function(Popular value) popular,
    required TResult Function(Seasonal value) seasonal,
    required TResult Function(Genre value) genres,
  }) {
    return popular(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Recent value)? recent,
    TResult Function(Popular value)? popular,
    TResult Function(Seasonal value)? seasonal,
    TResult Function(Genre value)? genres,
  }) {
    return popular?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Recent value)? recent,
    TResult Function(Popular value)? popular,
    TResult Function(Seasonal value)? seasonal,
    TResult Function(Genre value)? genres,
    required TResult orElse(),
  }) {
    if (popular != null) {
      return popular(this);
    }
    return orElse();
  }
}

abstract class Popular implements HomeNetworkPage {
  const factory Popular(int pageNum) = _$Popular;

  @override
  int get pageNum;
  @override
  @JsonKey(ignore: true)
  $PopularCopyWith<Popular> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonalCopyWith<$Res>
    implements $HomeNetworkPageCopyWith<$Res> {
  factory $SeasonalCopyWith(Seasonal value, $Res Function(Seasonal) then) =
      _$SeasonalCopyWithImpl<$Res>;
  @override
  $Res call({int pageNum, Season? season, int? year});
}

/// @nodoc
class _$SeasonalCopyWithImpl<$Res> extends _$HomeNetworkPageCopyWithImpl<$Res>
    implements $SeasonalCopyWith<$Res> {
  _$SeasonalCopyWithImpl(Seasonal _value, $Res Function(Seasonal) _then)
      : super(_value, (v) => _then(v as Seasonal));

  @override
  Seasonal get _value => super._value as Seasonal;

  @override
  $Res call({
    Object? pageNum = freezed,
    Object? season = freezed,
    Object? year = freezed,
  }) {
    return _then(Seasonal(
      pageNum == freezed
          ? _value.pageNum
          : pageNum // ignore: cast_nullable_to_non_nullable
              as int,
      season: season == freezed
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as Season?,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$Seasonal implements Seasonal {
  const _$Seasonal(this.pageNum, {this.season, this.year});

  @override
  final int pageNum;
  @override
  final Season? season;
  @override
  final int? year;

  @override
  String toString() {
    return 'HomeNetworkPage.seasonal(pageNum: $pageNum, season: $season, year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Seasonal &&
            const DeepCollectionEquality().equals(other.pageNum, pageNum) &&
            const DeepCollectionEquality().equals(other.season, season) &&
            const DeepCollectionEquality().equals(other.year, year));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageNum),
      const DeepCollectionEquality().hash(season),
      const DeepCollectionEquality().hash(year));

  @JsonKey(ignore: true)
  @override
  $SeasonalCopyWith<Seasonal> get copyWith =>
      _$SeasonalCopyWithImpl<Seasonal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNum) recent,
    required TResult Function(int pageNum) popular,
    required TResult Function(int pageNum, Season? season, int? year) seasonal,
    required TResult Function(int pageNum, Genres genre) genres,
  }) {
    return seasonal(pageNum, season, year);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int pageNum)? recent,
    TResult Function(int pageNum)? popular,
    TResult Function(int pageNum, Season? season, int? year)? seasonal,
    TResult Function(int pageNum, Genres genre)? genres,
  }) {
    return seasonal?.call(pageNum, season, year);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNum)? recent,
    TResult Function(int pageNum)? popular,
    TResult Function(int pageNum, Season? season, int? year)? seasonal,
    TResult Function(int pageNum, Genres genre)? genres,
    required TResult orElse(),
  }) {
    if (seasonal != null) {
      return seasonal(pageNum, season, year);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Recent value) recent,
    required TResult Function(Popular value) popular,
    required TResult Function(Seasonal value) seasonal,
    required TResult Function(Genre value) genres,
  }) {
    return seasonal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Recent value)? recent,
    TResult Function(Popular value)? popular,
    TResult Function(Seasonal value)? seasonal,
    TResult Function(Genre value)? genres,
  }) {
    return seasonal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Recent value)? recent,
    TResult Function(Popular value)? popular,
    TResult Function(Seasonal value)? seasonal,
    TResult Function(Genre value)? genres,
    required TResult orElse(),
  }) {
    if (seasonal != null) {
      return seasonal(this);
    }
    return orElse();
  }
}

abstract class Seasonal implements HomeNetworkPage {
  const factory Seasonal(int pageNum, {Season? season, int? year}) = _$Seasonal;

  @override
  int get pageNum;
  Season? get season;
  int? get year;
  @override
  @JsonKey(ignore: true)
  $SeasonalCopyWith<Seasonal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreCopyWith<$Res> implements $HomeNetworkPageCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) then) =
      _$GenreCopyWithImpl<$Res>;
  @override
  $Res call({int pageNum, Genres genre});
}

/// @nodoc
class _$GenreCopyWithImpl<$Res> extends _$HomeNetworkPageCopyWithImpl<$Res>
    implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(Genre _value, $Res Function(Genre) _then)
      : super(_value, (v) => _then(v as Genre));

  @override
  Genre get _value => super._value as Genre;

  @override
  $Res call({
    Object? pageNum = freezed,
    Object? genre = freezed,
  }) {
    return _then(Genre(
      pageNum == freezed
          ? _value.pageNum
          : pageNum // ignore: cast_nullable_to_non_nullable
              as int,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Genres,
    ));
  }
}

/// @nodoc

class _$Genre implements Genre {
  const _$Genre(this.pageNum, {this.genre = Genres.action});

  @override
  final int pageNum;
  @JsonKey()
  @override
  final Genres genre;

  @override
  String toString() {
    return 'HomeNetworkPage.genres(pageNum: $pageNum, genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Genre &&
            const DeepCollectionEquality().equals(other.pageNum, pageNum) &&
            const DeepCollectionEquality().equals(other.genre, genre));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageNum),
      const DeepCollectionEquality().hash(genre));

  @JsonKey(ignore: true)
  @override
  $GenreCopyWith<Genre> get copyWith =>
      _$GenreCopyWithImpl<Genre>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageNum) recent,
    required TResult Function(int pageNum) popular,
    required TResult Function(int pageNum, Season? season, int? year) seasonal,
    required TResult Function(int pageNum, Genres genre) genres,
  }) {
    return genres(pageNum, genre);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int pageNum)? recent,
    TResult Function(int pageNum)? popular,
    TResult Function(int pageNum, Season? season, int? year)? seasonal,
    TResult Function(int pageNum, Genres genre)? genres,
  }) {
    return genres?.call(pageNum, genre);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageNum)? recent,
    TResult Function(int pageNum)? popular,
    TResult Function(int pageNum, Season? season, int? year)? seasonal,
    TResult Function(int pageNum, Genres genre)? genres,
    required TResult orElse(),
  }) {
    if (genres != null) {
      return genres(pageNum, genre);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Recent value) recent,
    required TResult Function(Popular value) popular,
    required TResult Function(Seasonal value) seasonal,
    required TResult Function(Genre value) genres,
  }) {
    return genres(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Recent value)? recent,
    TResult Function(Popular value)? popular,
    TResult Function(Seasonal value)? seasonal,
    TResult Function(Genre value)? genres,
  }) {
    return genres?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Recent value)? recent,
    TResult Function(Popular value)? popular,
    TResult Function(Seasonal value)? seasonal,
    TResult Function(Genre value)? genres,
    required TResult orElse(),
  }) {
    if (genres != null) {
      return genres(this);
    }
    return orElse();
  }
}

abstract class Genre implements HomeNetworkPage {
  const factory Genre(int pageNum, {Genres genre}) = _$Genre;

  @override
  int get pageNum;
  Genres get genre;
  @override
  @JsonKey(ignore: true)
  $GenreCopyWith<Genre> get copyWith => throw _privateConstructorUsedError;
}
