import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_grid.dart';
import '../../../movies/presentation/widgets/movies_grid.dart';
import '../../../tv_shows/presentation/widgets/tv_shows_grid.dart';
import '../providers/search_providers.dart';
import '../widgets/search_field.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const SearchField(),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.movie), text: 'Películas'),
              Tab(icon: Icon(Icons.tv), text: 'Series'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [_MoviesResults(), _TvResults()],
        ),
      ),
    );
  }
}

class _MoviesResults extends ConsumerWidget {
  const _MoviesResults();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider).trim();
    final results = ref.watch(movieSearchResultsProvider);

    if (query.isEmpty) {
      return const _Hint(message: 'Escribe para buscar películas.');
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: results.when(
        loading: () => const LoadingGrid(),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(movieSearchResultsProvider),
        ),
        data: (movies) =>
            MoviesGrid(movies: movies, heroPrefix: 'search-movies'),
      ),
    );
  }
}

class _TvResults extends ConsumerWidget {
  const _TvResults();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider).trim();
    final results = ref.watch(tvSearchResultsProvider);

    if (query.isEmpty) {
      return const _Hint(message: 'Escribe para buscar series.');
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: results.when(
        loading: () => const LoadingGrid(),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(tvSearchResultsProvider),
        ),
        data: (shows) => TvShowsGrid(tvShows: shows, heroPrefix: 'search-tv'),
      ),
    );
  }
}

class _Hint extends StatelessWidget {
  const _Hint({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search, size: 56, color: Colors.white24),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white60,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
