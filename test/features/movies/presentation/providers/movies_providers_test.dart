import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_app/core/error/exceptions.dart';
import 'package:tmdb_app/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:tmdb_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:tmdb_app/features/movies/presentation/providers/movies_providers.dart';

import '../../../../helpers/fixtures.dart';

class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  late MockMoviesRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = MockMoviesRepository();
    container = ProviderContainer(
      overrides: [moviesRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);
  });

  group('moviesByCategoryProvider', () {
    test('emite AsyncData con la lista al pedir populares', () async {
      when(() => repository.getPopular())
          .thenAnswer((_) async => [sampleMovie()]);

      final movies =
          await container.read(moviesByCategoryProvider.future);

      expect(movies, hasLength(1));
      expect(movies.first.id, 550);
      verify(() => repository.getPopular()).called(1);
    });

    test('emite AsyncError cuando el repository falla', () async {
      when(() => repository.getPopular())
          .thenThrow(const ServerException('boom'));

      await expectLater(
        container.read(moviesByCategoryProvider.future),
        throwsA(isA<ServerException>()),
      );
    });

    test('cambia de dataset al alternar la categoría', () async {
      when(() => repository.getPopular())
          .thenAnswer((_) async => [sampleMovie()]);
      when(() => repository.getTopRated()).thenAnswer((_) async => []);

      await container.read(moviesByCategoryProvider.future);

      container.read(selectedMoviesCategoryProvider.notifier).state =
          MoviesCategory.topRated;

      final result =
          await container.read(moviesByCategoryProvider.future);
      expect(result, isEmpty);
      verify(() => repository.getTopRated()).called(1);
    });
  });
}
