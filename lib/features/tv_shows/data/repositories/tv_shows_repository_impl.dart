import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/tv_show.dart';
import '../../domain/repositories/tv_shows_repository.dart';
import '../datasources/tv_shows_remote_datasource.dart';

class TvShowsRepositoryImpl implements TvShowsRepository {
  const TvShowsRepositoryImpl(this._remote);
  final TvShowsRemoteDataSource _remote;

  @override
  Future<List<TvShow>> getPopular() async {
    final dtos = await _remote.getPopular();
    return dtos.map((d) => d.toEntity()).toList();
  }

  @override
  Future<List<TvShow>> getTopRated() async {
    final dtos = await _remote.getTopRated();
    return dtos.map((d) => d.toEntity()).toList();
  }

  @override
  Future<TvShow> getDetail(int id) async {
    final dto = await _remote.getDetail(id);
    return dto.toEntity();
  }
}

final tvShowsRepositoryProvider = Provider<TvShowsRepository>((ref) {
  return TvShowsRepositoryImpl(ref.watch(tvShowsRemoteDataSourceProvider));
});
