import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show.freezed.dart';

@freezed
class TvShow with _$TvShow {
  const factory TvShow({
    required int id,
    required String name,
    required String overview,
    String? posterPath,
    String? backdropPath,
    @Default(0.0) double voteAverage,
    DateTime? firstAirDate,
    @Default(<String>[]) List<String> genres,
    int? numberOfSeasons,
    int? numberOfEpisodes,
    String? tagline,
  }) = _TvShow;
}
