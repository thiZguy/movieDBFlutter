import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_app/features/movies/data/models/movie_dto.dart';

import '../../../../helpers/fixtures.dart';

void main() {
  group('MovieDto', () {
    test('parsea JSON de TMDB y mapea a entidad', () {
      final dto = MovieDto.fromJson(sampleMovieJson);
      final entity = dto.toEntity();

      expect(entity.id, 550);
      expect(entity.title, 'Fight Club');
      expect(entity.posterPath, '/poster.jpg');
      expect(entity.voteAverage, 8.4);
      expect(entity.releaseDate, DateTime(1999, 10, 15));
      expect(entity.genres, ['Drama']);
      expect(entity.runtime, 139);
      expect(entity.tagline, 'Mischief. Mayhem. Soap.');
    });

    test('maneja campos faltantes con valores por defecto', () {
      final dto = MovieDto.fromJson({'id': 1});
      final entity = dto.toEntity();

      expect(entity.id, 1);
      expect(entity.title, '');
      expect(entity.overview, '');
      expect(entity.voteAverage, 0.0);
      expect(entity.releaseDate, isNull);
      expect(entity.genres, isEmpty);
    });
  });
}
