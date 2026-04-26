import '../entities/movie.dart';

abstract interface class MoviesRepository {
  Future<List<Movie>> getPopular();
  Future<List<Movie>> getTopRated();
  Future<Movie> getDetail(int id);
}
