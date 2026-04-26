import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/movies_providers.dart';

class CategoryToggle extends ConsumerWidget {
  const CategoryToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedMoviesCategoryProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SegmentedButton<MoviesCategory>(
        segments: const [
          ButtonSegment(
            value: MoviesCategory.popular,
            label: Text('Populares'),
            icon: Icon(Icons.trending_up),
          ),
          ButtonSegment(
            value: MoviesCategory.topRated,
            label: Text('Mejor evaluadas'),
            icon: Icon(Icons.star),
          ),
        ],
        selected: {selected},
        onSelectionChanged: (s) {
          ref.read(selectedMoviesCategoryProvider.notifier).state = s.first;
        },
      ),
    );
  }
}
