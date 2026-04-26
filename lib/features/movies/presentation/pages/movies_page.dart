import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_grid.dart';
import '../providers/movies_providers.dart';
import '../widgets/category_toggle.dart';
import '../widgets/movies_grid.dart';

class MoviesPage extends ConsumerWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMovies = ref.watch(moviesByCategoryProvider);

    return Column(
      children: [
        const CategoryToggle(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(moviesByCategoryProvider);
              await ref.read(moviesByCategoryProvider.future);
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: asyncMovies.when(
                loading: () => const LoadingGrid(),
                error: (e, _) => ErrorView(
                  error: e,
                  onRetry: () => ref.invalidate(moviesByCategoryProvider),
                ),
                data: (movies) =>
                    MoviesGrid(movies: movies, heroPrefix: 'movies'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
