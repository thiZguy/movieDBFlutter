import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/tv_shows_providers.dart';

class TvCategoryToggle extends ConsumerWidget {
  const TvCategoryToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedTvShowsCategoryProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SegmentedButton<TvShowsCategory>(
        segments: const [
          ButtonSegment(
            value: TvShowsCategory.popular,
            label: Text('Populares'),
            icon: Icon(Icons.trending_up),
          ),
          ButtonSegment(
            value: TvShowsCategory.topRated,
            label: Text('Mejor evaluadas'),
            icon: Icon(Icons.star),
          ),
        ],
        selected: {selected},
        onSelectionChanged: (s) {
          ref.read(selectedTvShowsCategoryProvider.notifier).state = s.first;
        },
      ),
    );
  }
}
