import '../entities/movie.dart';
import '../repositories/movies_repository.dart';

class GetMovieDetail {
  const GetMovieDetail(this._repository);
  final MoviesRepository _repository;

  Future<Movie> call(int id) => _repository.getDetail(id);
}
