import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_app/features/tv_shows/domain/repositories/tv_shows_repository.dart';
import 'package:tmdb_app/features/tv_shows/domain/usecases/get_popular_tv_shows.dart';

import '../../../../helpers/fixtures.dart';

class MockTvShowsRepository extends Mock implements TvShowsRepository {}

void main() {
  test('GetPopularTvShows delega al repository', () async {
    final repository = MockTvShowsRepository();
    final usecase = GetPopularTvShows(repository);
    final shows = [sampleTvShow()];
    when(() => repository.getPopular()).thenAnswer((_) async => shows);

    final result = await usecase();

    expect(result, shows);
    verify(() => repository.getPopular()).called(1);
  });
}
