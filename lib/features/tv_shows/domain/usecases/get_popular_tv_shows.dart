import '../entities/tv_show.dart';
import '../repositories/tv_shows_repository.dart';

class GetPopularTvShows {
  const GetPopularTvShows(this._repository);
  final TvShowsRepository _repository;

  Future<List<TvShow>> call() => _repository.getPopular();
}
