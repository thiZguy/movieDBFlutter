import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../../shared/widgets/poster_image.dart';
import '../../../../shared/widgets/rating_badge.dart';
import '../../domain/entities/tv_show.dart';

class TvShowCard extends StatelessWidget {
  const TvShowCard({super.key, required this.tvShow, required this.heroPrefix});

  final TvShow tvShow;
  final String heroPrefix;

  @override
  Widget build(BuildContext context) {
    final heroTag = '$heroPrefix-${tvShow.id}';
    return InkWell(
      onTap: () => context.push('/tv/${tvShow.id}', extra: heroTag),
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
                      url: AppConfig.posterUrl(tvShow.posterPath),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: RatingBadge(rating: tvShow.voteAverage, compact: true),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tvShow.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
