import '../entities/movie.dart';
import '../repositories/movies_repository.dart';

class GetTopRatedMovies {
  const GetTopRatedMovies(this._repository);
  final MoviesRepository _repository;

  Future<List<Movie>> call() => _repository.getTopRated();
}
