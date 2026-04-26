import '../../../movies/domain/entities/movie.dart';
import '../../../tv_shows/domain/entities/tv_show.dart';

abstract interface class SearchRepository {
  Future<List<Movie>> searchMovies(String query);
  Future<List<TvShow>> searchTvShows(String query);
}
