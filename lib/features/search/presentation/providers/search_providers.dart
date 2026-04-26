import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../movies/domain/entities/movie.dart';
import '../../../tv_shows/domain/entities/tv_show.dart';
import '../../data/repositories/search_repository_impl.dart';
import '../../domain/usecases/search_movies.dart';
import '../../domain/usecases/search_tv_shows.dart';

final searchMoviesProvider = Provider<SearchMovies>((ref) {
  return SearchMovies(ref.watch(searchRepositoryProvider));
});

final searchTvShowsProvider = Provider<SearchTvShows>((ref) {
  return SearchTvShows(ref.watch(searchRepositoryProvider));
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final movieSearchResultsProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
  final query = ref.watch(searchQueryProvider).trim();
  if (query.isEmpty) return [];
  return ref.watch(searchMoviesProvider).call(query);
});

final tvSearchResultsProvider =
    FutureProvider.autoDispose<List<TvShow>>((ref) async {
  final query = ref.watch(searchQueryProvider).trim();
  if (query.isEmpty) return [];
  return ref.watch(searchTvShowsProvider).call(query);
});
