import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../models/movie_dto.dart';

class MoviesRemoteDataSource {
  const MoviesRemoteDataSource(this._dio);
  final Dio _dio;

  Future<List<MovieDto>> getPopular() => _list(ApiEndpoints.moviePopular);

  Future<List<MovieDto>> getTopRated() => _list(ApiEndpoints.movieTopRated);

  Future<MovieDto> getDetail(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.movieDetail(id),
      );
      return MovieDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<List<MovieDto>> _list(String path) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(path);
      final results = (response.data?['results'] as List<dynamic>? ?? []);
      return results
          .map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}

final moviesRemoteDataSourceProvider = Provider<MoviesRemoteDataSource>((ref) {
  return MoviesRemoteDataSource(ref.watch(dioClientProvider));
});
