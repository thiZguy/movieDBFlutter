import '../entities/movie.dart';
import '../repositories/movies_repository.dart';

class GetPopularMovies {
  const GetPopularMovies(this._repository);
  final MoviesRepository _repository;

  Future<List<Movie>> call() => _repository.getPopular();
}
