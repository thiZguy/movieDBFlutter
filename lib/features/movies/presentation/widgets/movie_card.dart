import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../../shared/widgets/poster_image.dart';
import '../../../../shared/widgets/rating_badge.dart';
import '../../domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie, required this.heroPrefix});

  final Movie movie;
  final String heroPrefix;

  @override
  Widget build(BuildContext context) {
    final heroTag = '$heroPrefix-${movie.id}';
    return InkWell(
      onTap: () => context.push('/movie/${movie.id}', extra: heroTag),
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: heroTag,
                    child: PosterImage(
                      url: AppConfig.posterUrl(movie.posterPath),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: RatingBadge(rating: movie.voteAverage, compact: true),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
