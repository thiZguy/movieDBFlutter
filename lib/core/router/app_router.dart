import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/movies/presentation/pages/movie_detail_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../features/tv_shows/presentation/pages/tv_show_detail_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: '/movie/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          final heroTag = state.extra as String?;
          return MovieDetailPage(movieId: id, heroTag: heroTag);
        },
      ),
      GoRoute(
        path: '/tv/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          final heroTag = state.extra as String?;
          return TvShowDetailPage(tvShowId: id, heroTag: heroTag);
        },
      ),
    ],
  );
});
