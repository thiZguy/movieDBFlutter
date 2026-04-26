import '../entities/tv_show.dart';
import '../repositories/tv_shows_repository.dart';

class GetTvShowDetail {
  const GetTvShowDetail(this._repository);
  final TvShowsRepository _repository;

  Future<TvShow> call(int id) => _repository.getDetail(id);
}
