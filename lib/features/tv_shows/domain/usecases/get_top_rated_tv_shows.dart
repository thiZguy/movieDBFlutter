import '../entities/tv_show.dart';
import '../repositories/tv_shows_repository.dart';

class GetTopRatedTvShows {
  const GetTopRatedTvShows(this._repository);
  final TvShowsRepository _repository;

  Future<List<TvShow>> call() => _repository.getTopRated();
}
