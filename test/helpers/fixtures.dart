import 'package:tmdb_app/features/movies/domain/entities/movie.dart';
import 'package:tmdb_app/features/tv_shows/domain/entities/tv_show.dart';

const sampleMovieJson = {
  'id': 550,
  'title': 'Fight Club',
  'overview': 'A ticking-time-bomb insomniac...',
  'poster_path': '/poster.jpg',
  'backdrop_path': '/backdrop.jpg',
  'vote_average': 8.4,
  'release_date': '1999-10-15',
  'genres': [
    {'id': 18, 'name': 'Drama'},
  ],
  'runtime': 139,
  'tagline': 'Mischief. Mayhem. Soap.',
};

const sampleMovieListJson = {
  'page': 1,
  'results': [sampleMovieJson],
  'total_pages': 1,
  'total_results': 1,
};

Movie sampleMovie() => Movie(
      id: 550,
      title: 'Fight Club',
      overview: 'A ticking-time-bomb insomniac...',
      posterPath: '/poster.jpg',
      voteAverage: 8.4,
    );

TvShow sampleTvShow() => TvShow(
      id: 1399,
      name: 'Game of Thrones',
      overview: 'Seven noble families fight...',
      posterPath: '/got.jpg',
      voteAverage: 8.3,
    );
