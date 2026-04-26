// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/movie.dart';

part 'movie_dto.freezed.dart';
part 'movie_dto.g.dart';

@freezed
class MovieDto with _$MovieDto {
  const MovieDto._();

  const factory MovieDto({
    required int id,
    String? title,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'release_date') String? releaseDate,
    @Default(<GenreDto>[]) List<GenreDto> genres,
    int? runtime,
    String? tagline,
  }) = _MovieDto;

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  Movie toEntity() => Movie(
        id: id,
        title: title ?? '',
        overview: overview ?? '',
        posterPath: posterPath,
        backdropPath: backdropPath,
        voteAverage: voteAverage ?? 0.0,
        releaseDate: _parseDate(releaseDate),
        genres: genres.map((g) => g.name).toList(),
        runtime: runtime,
        tagline: tagline,
      );
}

@freezed
class GenreDto with _$GenreDto {
  const factory GenreDto({
    required int id,
    required String name,
  }) = _GenreDto;

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      _$GenreDtoFromJson(json);
}

DateTime? _parseDate(String? raw) {
  if (raw == null || raw.isEmpty) return null;
  return DateTime.tryParse(raw);
}
