import '../../../tv_shows/domain/entities/tv_show.dart';
import '../repositories/search_repository.dart';

class SearchTvShows {
  const SearchTvShows(this._repository);
  final SearchRepository _repository;

  Future<List<TvShow>> call(String query) => _repository.searchTvShows(query);
}
