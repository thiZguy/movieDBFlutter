import '../entities/tv_show.dart';

abstract interface class TvShowsRepository {
  Future<List<TvShow>> getPopular();
  Future<List<TvShow>> getTopRated();
  Future<TvShow> getDetail(int id);
}
