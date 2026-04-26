import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/loading_grid.dart';
import '../providers/tv_shows_providers.dart';
import '../widgets/tv_category_toggle.dart';
import '../widgets/tv_shows_grid.dart';

class TvShowsPage extends ConsumerWidget {
  const TvShowsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTvShows = ref.watch(tvShowsByCategoryProvider);

    return Column(
      children: [
        const TvCategoryToggle(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(tvShowsByCategoryProvider);
              await ref.read(tvShowsByCategoryProvider.future);
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: asyncTvShows.when(
                loading: () => const LoadingGrid(),
                error: (e, _) => ErrorView(
                  error: e,
                  onRetry: () => ref.invalidate(tvShowsByCategoryProvider),
                ),
                data: (shows) =>
                    TvShowsGrid(tvShows: shows, heroPrefix: 'tv'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
