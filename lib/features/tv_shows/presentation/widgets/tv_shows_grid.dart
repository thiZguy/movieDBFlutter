import 'package:flutter/material.dart';

import '../../domain/entities/tv_show.dart';
import 'tv_show_card.dart';

class TvShowsGrid extends StatelessWidget {
  const TvShowsGrid({
    super.key,
    required this.tvShows,
    required this.heroPrefix,
  });

  final List<TvShow> tvShows;
  final String heroPrefix;

  @override
  Widget build(BuildContext context) {
    if (tvShows.isEmpty) {
      return const Center(
        child: Text('No hay resultados', style: TextStyle(color: Colors.white60)),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemCount: tvShows.length,
      itemBuilder: (context, index) {
        return TvShowCard(tvShow: tvShows[index], heroPrefix: heroPrefix);
      },
    );
  }
}
