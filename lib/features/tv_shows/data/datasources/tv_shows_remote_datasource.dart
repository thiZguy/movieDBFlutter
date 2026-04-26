import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../models/tv_show_dto.dart';

class TvShowsRemoteDataSource {
  const TvShowsRemoteDataSource(this._dio);
  final Dio _dio;

  Future<List<TvShowDto>> getPopular() => _list(ApiEndpoints.tvPopular);

  Future<List<TvShowDto>> getTopRated() => _list(ApiEndpoints.tvTopRated);

  Future<TvShowDto> getDetail(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.tvDetail(id),
      );
      return TvShowDto.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<List<TvShowDto>> _list(String path) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(path);
      final results = (response.data?['results'] as List<dynamic>? ?? []);
      return results
          .map((e) => TvShowDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}

final tvShowsRemoteDataSourceProvider =
    Provider<TvShowsRemoteDataSource>((ref) {
  return TvShowsRemoteDataSource(ref.watch(dioClientProvider));
});
