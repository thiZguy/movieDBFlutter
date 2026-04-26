import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/tv_shows_repository_impl.dart';
import '../../domain/entities/tv_show.dart';
import '../../domain/usecases/get_popular_tv_shows.dart';
import '../../domain/usecases/get_top_rated_tv_shows.dart';
import '../../domain/usecases/get_tv_show_detail.dart';

enum TvShowsCategory { popular, topRated }

final getPopularTvShowsProvider = Provider<GetPopularTvShows>((ref) {
  return GetPopularTvShows(ref.watch(tvShowsRepositoryProvider));
});

final getTopRatedTvShowsProvider = Provider<GetTopRatedTvShows>((ref) {
  return GetTopRatedTvShows(ref.watch(tvShowsRepositoryProvider));
});

final getTvShowDetailProvider = Provider<GetTvShowDetail>((ref) {
  return GetTvShowDetail(ref.watch(tvShowsRepositoryProvider));
});

final selectedTvShowsCategoryProvider =
    StateProvider<TvShowsCategory>((ref) => TvShowsCategory.popular);

final popularTvShowsProvider = FutureProvider<List<TvShow>>((ref) {
  return ref.watch(getPopularTvShowsProvider).call();
});

final topRatedTvShowsProvider = FutureProvider<List<TvShow>>((ref) {
  return ref.watch(getTopRatedTvShowsProvider).call();
});

final tvShowsByCategoryProvider = FutureProvider<List<TvShow>>((ref) {
  final category = ref.watch(selectedTvShowsCategoryProvider);
  return switch (category) {
    TvShowsCategory.popular => ref.watch(popularTvShowsProvider.future),
    TvShowsCategory.topRated => ref.watch(topRatedTvShowsProvider.future),
  };
});

final tvShowDetailProvider =
    FutureProvider.family.autoDispose<TvShow, int>((ref, id) {
  return ref.watch(getTvShowDetailProvider).call(id);
});
