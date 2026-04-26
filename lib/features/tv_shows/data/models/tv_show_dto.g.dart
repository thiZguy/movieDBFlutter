// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvShowDtoImpl _$$TvShowDtoImplFromJson(Map<String, dynamic> json) =>
    _$TvShowDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      firstAirDate: json['first_air_date'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((e) => TvGenreDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TvGenreDto>[],
      numberOfSeasons: (json['number_of_seasons'] as num?)?.toInt(),
      numberOfEpisodes: (json['number_of_episodes'] as num?)?.toInt(),
      tagline: json['tagline'] as String?,
    );

Map<String, dynamic> _$$TvShowDtoImplToJson(_$TvShowDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
      'first_air_date': instance.firstAirDate,
      'genres': instance.genres,
      'number_of_seasons': instance.numberOfSeasons,
      'number_of_episodes': instance.numberOfEpisodes,
      'tagline': instance.tagline,
    };

_$TvGenreDtoImpl _$$TvGenreDtoImplFromJson(Map<String, dynamic> json) =>
    _$TvGenreDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$TvGenreDtoImplToJson(_$TvGenreDtoImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
