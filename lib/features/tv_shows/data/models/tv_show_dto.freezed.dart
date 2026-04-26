// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_show_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TvShowDto _$TvShowDtoFromJson(Map<String, dynamic> json) {
  return _TvShowDto.fromJson(json);
}

/// @nodoc
mixin _$TvShowDto {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate => throw _privateConstructorUsedError;
  List<TvGenreDto> get genres => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_seasons')
  int? get numberOfSeasons => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_episodes')
  int? get numberOfEpisodes => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;

  /// Serializes this TvShowDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TvShowDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvShowDtoCopyWith<TvShowDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvShowDtoCopyWith<$Res> {
  factory $TvShowDtoCopyWith(TvShowDto value, $Res Function(TvShowDto) then) =
      _$TvShowDtoCopyWithImpl<$Res, TvShowDto>;
  @useResult
  $Res call({
    int id,
    String? name,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    List<TvGenreDto> genres,
    @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
    @JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,
    String? tagline,
  });
}

/// @nodoc
class _$TvShowDtoCopyWithImpl<$Res, $Val extends TvShowDto>
    implements $TvShowDtoCopyWith<$Res> {
  _$TvShowDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvShowDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = freezed,
    Object? firstAirDate = freezed,
    Object? genres = null,
    Object? numberOfSeasons = freezed,
    Object? numberOfEpisodes = freezed,
    Object? tagline = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            overview: freezed == overview
                ? _value.overview
                : overview // ignore: cast_nullable_to_non_nullable
                      as String?,
            posterPath: freezed == posterPath
                ? _value.posterPath
                : posterPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            backdropPath: freezed == backdropPath
                ? _value.backdropPath
                : backdropPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            voteAverage: freezed == voteAverage
                ? _value.voteAverage
                : voteAverage // ignore: cast_nullable_to_non_nullable
                      as double?,
            firstAirDate: freezed == firstAirDate
                ? _value.firstAirDate
                : firstAirDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            genres: null == genres
                ? _value.genres
                : genres // ignore: cast_nullable_to_non_nullable
                      as List<TvGenreDto>,
            numberOfSeasons: freezed == numberOfSeasons
                ? _value.numberOfSeasons
                : numberOfSeasons // ignore: cast_nullable_to_non_nullable
                      as int?,
            numberOfEpisodes: freezed == numberOfEpisodes
                ? _value.numberOfEpisodes
                : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
                      as int?,
            tagline: freezed == tagline
                ? _value.tagline
                : tagline // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TvShowDtoImplCopyWith<$Res>
    implements $TvShowDtoCopyWith<$Res> {
  factory _$$TvShowDtoImplCopyWith(
    _$TvShowDtoImpl value,
    $Res Function(_$TvShowDtoImpl) then,
  ) = __$$TvShowDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String? name,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    List<TvGenreDto> genres,
    @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
    @JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,
    String? tagline,
  });
}

/// @nodoc
class __$$TvShowDtoImplCopyWithImpl<$Res>
    extends _$TvShowDtoCopyWithImpl<$Res, _$TvShowDtoImpl>
    implements _$$TvShowDtoImplCopyWith<$Res> {
  __$$TvShowDtoImplCopyWithImpl(
    _$TvShowDtoImpl _value,
    $Res Function(_$TvShowDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TvShowDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = freezed,
    Object? firstAirDate = freezed,
    Object? genres = null,
    Object? numberOfSeasons = freezed,
    Object? numberOfEpisodes = freezed,
    Object? tagline = freezed,
  }) {
    return _then(
      _$TvShowDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        overview: freezed == overview
            ? _value.overview
            : overview // ignore: cast_nullable_to_non_nullable
                  as String?,
        posterPath: freezed == posterPath
            ? _value.posterPath
            : posterPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        backdropPath: freezed == backdropPath
            ? _value.backdropPath
            : backdropPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        voteAverage: freezed == voteAverage
            ? _value.voteAverage
            : voteAverage // ignore: cast_nullable_to_non_nullable
                  as double?,
        firstAirDate: freezed == firstAirDate
            ? _value.firstAirDate
            : firstAirDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        genres: null == genres
            ? _value._genres
            : genres // ignore: cast_nullable_to_non_nullable
                  as List<TvGenreDto>,
        numberOfSeasons: freezed == numberOfSeasons
            ? _value.numberOfSeasons
            : numberOfSeasons // ignore: cast_nullable_to_non_nullable
                  as int?,
        numberOfEpisodes: freezed == numberOfEpisodes
            ? _value.numberOfEpisodes
            : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
                  as int?,
        tagline: freezed == tagline
            ? _value.tagline
            : tagline // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TvShowDtoImpl extends _TvShowDto {
  const _$TvShowDtoImpl({
    required this.id,
    this.name,
    this.overview,
    @JsonKey(name: 'poster_path') this.posterPath,
    @JsonKey(name: 'backdrop_path') this.backdropPath,
    @JsonKey(name: 'vote_average') this.voteAverage,
    @JsonKey(name: 'first_air_date') this.firstAirDate,
    final List<TvGenreDto> genres = const <TvGenreDto>[],
    @JsonKey(name: 'number_of_seasons') this.numberOfSeasons,
    @JsonKey(name: 'number_of_episodes') this.numberOfEpisodes,
    this.tagline,
  }) : _genres = genres,
       super._();

  factory _$TvShowDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvShowDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;
  final List<TvGenreDto> _genres;
  @override
  @JsonKey()
  List<TvGenreDto> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  @JsonKey(name: 'number_of_seasons')
  final int? numberOfSeasons;
  @override
  @JsonKey(name: 'number_of_episodes')
  final int? numberOfEpisodes;
  @override
  final String? tagline;

  @override
  String toString() {
    return 'TvShowDto(id: $id, name: $name, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, firstAirDate: $firstAirDate, genres: $genres, numberOfSeasons: $numberOfSeasons, numberOfEpisodes: $numberOfEpisodes, tagline: $tagline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvShowDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.numberOfSeasons, numberOfSeasons) ||
                other.numberOfSeasons == numberOfSeasons) &&
            (identical(other.numberOfEpisodes, numberOfEpisodes) ||
                other.numberOfEpisodes == numberOfEpisodes) &&
            (identical(other.tagline, tagline) || other.tagline == tagline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    overview,
    posterPath,
    backdropPath,
    voteAverage,
    firstAirDate,
    const DeepCollectionEquality().hash(_genres),
    numberOfSeasons,
    numberOfEpisodes,
    tagline,
  );

  /// Create a copy of TvShowDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvShowDtoImplCopyWith<_$TvShowDtoImpl> get copyWith =>
      __$$TvShowDtoImplCopyWithImpl<_$TvShowDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvShowDtoImplToJson(this);
  }
}

abstract class _TvShowDto extends TvShowDto {
  const factory _TvShowDto({
    required final int id,
    final String? name,
    final String? overview,
    @JsonKey(name: 'poster_path') final String? posterPath,
    @JsonKey(name: 'backdrop_path') final String? backdropPath,
    @JsonKey(name: 'vote_average') final double? voteAverage,
    @JsonKey(name: 'first_air_date') final String? firstAirDate,
    final List<TvGenreDto> genres,
    @JsonKey(name: 'number_of_seasons') final int? numberOfSeasons,
    @JsonKey(name: 'number_of_episodes') final int? numberOfEpisodes,
    final String? tagline,
  }) = _$TvShowDtoImpl;
  const _TvShowDto._() : super._();

  factory _TvShowDto.fromJson(Map<String, dynamic> json) =
      _$TvShowDtoImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get overview;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate;
  @override
  List<TvGenreDto> get genres;
  @override
  @JsonKey(name: 'number_of_seasons')
  int? get numberOfSeasons;
  @override
  @JsonKey(name: 'number_of_episodes')
  int? get numberOfEpisodes;
  @override
  String? get tagline;

  /// Create a copy of TvShowDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvShowDtoImplCopyWith<_$TvShowDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TvGenreDto _$TvGenreDtoFromJson(Map<String, dynamic> json) {
  return _TvGenreDto.fromJson(json);
}

/// @nodoc
mixin _$TvGenreDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this TvGenreDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TvGenreDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvGenreDtoCopyWith<TvGenreDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvGenreDtoCopyWith<$Res> {
  factory $TvGenreDtoCopyWith(
    TvGenreDto value,
    $Res Function(TvGenreDto) then,
  ) = _$TvGenreDtoCopyWithImpl<$Res, TvGenreDto>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$TvGenreDtoCopyWithImpl<$Res, $Val extends TvGenreDto>
    implements $TvGenreDtoCopyWith<$Res> {
  _$TvGenreDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvGenreDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TvGenreDtoImplCopyWith<$Res>
    implements $TvGenreDtoCopyWith<$Res> {
  factory _$$TvGenreDtoImplCopyWith(
    _$TvGenreDtoImpl value,
    $Res Function(_$TvGenreDtoImpl) then,
  ) = __$$TvGenreDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$TvGenreDtoImplCopyWithImpl<$Res>
    extends _$TvGenreDtoCopyWithImpl<$Res, _$TvGenreDtoImpl>
    implements _$$TvGenreDtoImplCopyWith<$Res> {
  __$$TvGenreDtoImplCopyWithImpl(
    _$TvGenreDtoImpl _value,
    $Res Function(_$TvGenreDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TvGenreDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$TvGenreDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TvGenreDtoImpl implements _TvGenreDto {
  const _$TvGenreDtoImpl({required this.id, required this.name});

  factory _$TvGenreDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvGenreDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'TvGenreDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvGenreDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of TvGenreDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvGenreDtoImplCopyWith<_$TvGenreDtoImpl> get copyWith =>
      __$$TvGenreDtoImplCopyWithImpl<_$TvGenreDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvGenreDtoImplToJson(this);
  }
}

abstract class _TvGenreDto implements TvGenreDto {
  const factory _TvGenreDto({
    required final int id,
    required final String name,
  }) = _$TvGenreDtoImpl;

  factory _TvGenreDto.fromJson(Map<String, dynamic> json) =
      _$TvGenreDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of TvGenreDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvGenreDtoImplCopyWith<_$TvGenreDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
