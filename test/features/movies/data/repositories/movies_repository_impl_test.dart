import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_app/core/error/exceptions.dart';
import 'package:tmdb_app/features/movies/data/datasources/movies_remote_datasource.dart';
import 'package:tmdb_app/features/movies/data/models/movie_dto.dart';
import 'package:tmdb_app/features/movies/data/repositories/movies_repository_impl.dart';

class MockMoviesRemoteDataSource extends Mock
    implements MoviesRemoteDataSource {}

void main() {
  late MockMoviesRemoteDataSource dataSource;
  late MoviesRepositoryImpl repository;

  setUp(() {
    dataSource = MockMoviesRemoteDataSource();
    repository = MoviesRepositoryImpl(dataSource);
  });

  group('MoviesRepositoryImpl.getPopular', () {
    test('mapea DTOs a entidades en happy path', () async {
      const dto = MovieDto(id: 1, title: 'Movie', overview: 'desc');
      when(() => dataSource.getPopular()).thenAnswer((_) async => [dto]);

      final result = await repository.getPopular();

      expect(result, hasLength(1));
      expect(result.first.id, 1);
      expect(result.first.title, 'Movie');
      verify(() => dataSource.getPopular()).called(1);
    });

    test('propaga excepciones del datasource', () {
      when(() => dataSource.getPopular())
          .thenThrow(const NetworkException('sin red'));

      expect(repository.getPopular(), throwsA(isA<NetworkException>()));
    });
  });
}
