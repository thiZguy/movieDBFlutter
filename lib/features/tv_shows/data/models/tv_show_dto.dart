// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/tv_show.dart';

part 'tv_show_dto.freezed.dart';
part 'tv_show_dto.g.dart';

@freezed
class TvShowDto with _$TvShowDto {
  const TvShowDto._();

  const factory TvShowDto({
    required int id,
    String? name,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    @Default(<TvGenreDto>[]) List<TvGenreDto> genres,
    @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
    @JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,
    String? tagline,
  }) = _TvShowDto;

  factory TvShowDto.fromJson(Map<String, dynamic> json) =>
      _$TvShowDtoFromJson(json);

  TvShow toEntity() => TvShow(
        id: id,
        name: name ?? '',
        overview: overview ?? '',
        posterPath: posterPath,
        backdropPath: backdropPath,
        voteAverage: voteAverage ?? 0.0,
        firstAirDate: _parseDate(firstAirDate),
        genres: genres.map((g) => g.name).toList(),
        numberOfSeasons: numberOfSeasons,
        numberOfEpisodes: numberOfEpisodes,
        tagline: tagline,
      );
}

@freezed
class TvGenreDto with _$TvGenreDto {
  const factory TvGenreDto({
    required int id,
    required String name,
  }) = _TvGenreDto;

  factory TvGenreDto.fromJson(Map<String, dynamic> json) =>
      _$TvGenreDtoFromJson(json);
}

DateTime? _parseDate(String? raw) {
  if (raw == null || raw.isEmpty) return null;
  return DateTime.tryParse(raw);
}
