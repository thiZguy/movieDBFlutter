import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    String? posterPath,
    String? backdropPath,
    @Default(0.0) double voteAverage,
    DateTime? releaseDate,
    @Default(<String>[]) List<String> genres,
    int? runtime,
    String? tagline,
  }) = _Movie;
}
