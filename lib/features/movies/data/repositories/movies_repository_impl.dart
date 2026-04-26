import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repositories/movies_repository.dart';
import '../datasources/movies_remote_datasource.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  const MoviesRepositoryImpl(this._remote);
  final MoviesRemoteDataSource _remote;

  @override
  Future<List<Movie>> getPopular() async {
    final dtos = await _remote.getPopular();
    return dtos.map((d) => d.toEntity()).toList();
  }

  @override
  Future<List<Movie>> getTopRated() async {
    final dtos = await _remote.getTopRated();
    return dtos.map((d) => d.toEntity()).toList();
  }

  @override
  Future<Movie> getDetail(int id) async {
    final dto = await _remote.getDetail(id);
    return dto.toEntity();
  }
}

final moviesRepositoryProvider = Provider<MoviesRepository>((ref) {
  return MoviesRepositoryImpl(ref.watch(moviesRemoteDataSourceProvider));
});
