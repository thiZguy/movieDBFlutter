import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/movies_repository_impl.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movie_detail.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';

enum MoviesCategory { popular, topRated }

final getPopularMoviesProvider = Provider<GetPopularMovies>((ref) {
  return GetPopularMovies(ref.watch(moviesRepositoryProvider));
});

final getTopRatedMoviesProvider = Provider<GetTopRatedMovies>((ref) {
  return GetTopRatedMovies(ref.watch(moviesRepositoryProvider));
});

final getMovieDetailProvider = Provider<GetMovieDetail>((ref) {
  return GetMovieDetail(ref.watch(moviesRepositoryProvider));
});

final selectedMoviesCategoryProvider =
    StateProvider<MoviesCategory>((ref) => MoviesCategory.popular);

final popularMoviesProvider = FutureProvider<List<Movie>>((ref) {
  return ref.watch(getPopularMoviesProvider).call();
});

final topRatedMoviesProvider = FutureProvider<List<Movie>>((ref) {
  return ref.watch(getTopRatedMoviesProvider).call();
});

final moviesByCategoryProvider = FutureProvider<List<Movie>>((ref) {
  final category = ref.watch(selectedMoviesCategoryProvider);
  return switch (category) {
    MoviesCategory.popular => ref.watch(popularMoviesProvider.future),
    MoviesCategory.topRated => ref.watch(topRatedMoviesProvider.future),
  };
});

final movieDetailProvider =
    FutureProvider.family.autoDispose<Movie, int>((ref, id) {
  return ref.watch(getMovieDetailProvider).call(id);
});
