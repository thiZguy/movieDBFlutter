import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../movies/domain/entities/movie.dart';
import '../../../tv_shows/domain/entities/tv_show.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_remote_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  const SearchRepositoryImpl(this._remote);
  final SearchRemoteDataSource _remote;

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final dtos = await _remote.searchMovies(query);
    return dtos.map((d) => d.toEntity()).toList();
  }

  @override
  Future<List<TvShow>> searchTvShows(String query) async {
    final dtos = await _remote.searchTvShows(query);
    return dtos.map((d) => d.toEntity()).toList();
  }
}

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepositoryImpl(ref.watch(searchRemoteDataSourceProvider));
});
