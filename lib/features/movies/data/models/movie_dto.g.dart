// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDtoImpl _$$MovieDtoImplFromJson(Map<String, dynamic> json) =>
    _$MovieDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      releaseDate: json['release_date'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GenreDto>[],
      runtime: (json['runtime'] as num?)?.toInt(),
      tagline: json['tagline'] as String?,
    );

Map<String, dynamic> _$$MovieDtoImplToJson(_$MovieDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate,
      'genres': instance.genres,
      'runtime': instance.runtime,
      'tagline': instance.tagline,
    };

_$GenreDtoImpl _$$GenreDtoImplFromJson(Map<String, dynamic> json) =>
    _$GenreDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$GenreDtoImplToJson(_$GenreDtoImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
