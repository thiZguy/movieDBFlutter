import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_app/features/search/data/repositories/search_repository_impl.dart';
import 'package:tmdb_app/features/search/domain/repositories/search_repository.dart';
import 'package:tmdb_app/features/search/presentation/providers/search_providers.dart';

import '../../../../helpers/fixtures.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  late MockSearchRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = MockSearchRepository();
    container = ProviderContainer(
      overrides: [searchRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);
  });

  test('movieSearchResultsProvider devuelve [] con query vacía', () async {
    final result = await container.read(movieSearchResultsProvider.future);
    expect(result, isEmpty);
    verifyNever(() => repository.searchMovies(any()));
  });

  test('movieSearchResultsProvider llama al repository con query', () async {
    when(() => repository.searchMovies('matrix'))
        .thenAnswer((_) async => [sampleMovie()]);

    container.read(searchQueryProvider.notifier).state = 'matrix';
    final result = await container.read(movieSearchResultsProvider.future);

    expect(result, hasLength(1));
    verify(() => repository.searchMovies('matrix')).called(1);
  });
}
