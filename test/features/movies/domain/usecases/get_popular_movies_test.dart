import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_app/features/movies/domain/entities/movie.dart';
import 'package:tmdb_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:tmdb_app/features/movies/domain/usecases/get_popular_movies.dart';

import '../../../../helpers/fixtures.dart';

class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  late MockMoviesRepository repository;
  late GetPopularMovies usecase;

  setUp(() {
    repository = MockMoviesRepository();
    usecase = GetPopularMovies(repository);
  });

  test('delega al repository.getPopular y devuelve la lista', () async {
    final movies = [sampleMovie()];
    when(() => repository.getPopular()).thenAnswer((_) async => movies);

    final result = await usecase();

    expect(result, isA<List<Movie>>());
    expect(result, movies);
    verify(() => repository.getPopular()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
