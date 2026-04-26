class ApiEndpoints {
  ApiEndpoints._();

  static const moviePopular = '/movie/popular';
  static const movieTopRated = '/movie/top_rated';
  static String movieDetail(int id) => '/movie/$id';

  static const tvPopular = '/tv/popular';
  static const tvTopRated = '/tv/top_rated';
  static String tvDetail(int id) => '/tv/$id';

  static const searchMovie = '/search/movie';
  static const searchTv = '/search/tv';
}
