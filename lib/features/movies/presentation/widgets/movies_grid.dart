import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import 'movie_card.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({
    super.key,
    required this.movies,
    required this.heroPrefix,
  });

  final List<Movie> movies;
  final String heroPrefix;

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
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
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index], heroPrefix: heroPrefix);
      },
    );
  }
}
