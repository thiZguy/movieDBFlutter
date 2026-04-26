import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  AppConfig._();

  static String get tmdbBearerToken => dotenv.env['TMDB_BEARER_TOKEN'] ?? '';
  static String get tmdbBaseUrl =>
      dotenv.env['TMDB_BASE_URL'] ?? 'https://api.themoviedb.org/3';
  static String get tmdbImageBaseUrl =>
      dotenv.env['TMDB_IMAGE_BASE_URL'] ?? 'https://image.tmdb.org/t/p';

  static String posterUrl(String? path, {String size = 'w500'}) {
    if (path == null || path.isEmpty) return '';
    return '$tmdbImageBaseUrl/$size$path';
  }

  static String backdropUrl(String? path, {String size = 'original'}) {
    if (path == null || path.isEmpty) return '';
    return '$tmdbImageBaseUrl/$size$path';
  }
}
