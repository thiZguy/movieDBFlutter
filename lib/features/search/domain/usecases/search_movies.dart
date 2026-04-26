import '../../../movies/domain/entities/movie.dart';
import '../repositories/search_repository.dart';

class SearchMovies {
  const SearchMovies(this._repository);
  final SearchRepository _repository;

  Future<List<Movie>> call(String query) => _repository.searchMovies(query);
}
