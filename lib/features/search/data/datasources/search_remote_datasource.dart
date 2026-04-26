import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../movies/data/models/movie_dto.dart';
import '../../../tv_shows/data/models/tv_show_dto.dart';

class SearchRemoteDataSource {
  const SearchRemoteDataSource(this._dio);
  final Dio _dio;

  Future<List<MovieDto>> searchMovies(String query) async {
    return _list<MovieDto>(
      ApiEndpoints.searchMovie,
      query,
      MovieDto.fromJson,
    );
  }

  Future<List<TvShowDto>> searchTvShows(String query) async {
    return _list<TvShowDto>(
      ApiEndpoints.searchTv,
      query,
      TvShowDto.fromJson,
    );
  }

  Future<List<T>> _list<T>(
    String path,
    String query,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: {'query': query},
      );
      final results = (response.data?['results'] as List<dynamic>? ?? []);
      return results
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}

final searchRemoteDataSourceProvider = Provider<SearchRemoteDataSource>((ref) {
  return SearchRemoteDataSource(ref.watch(dioClientProvider));
});
