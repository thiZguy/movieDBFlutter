import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/config/app_config.dart';
import '../../../../shared/widgets/error_view.dart';
import '../../../../shared/widgets/poster_image.dart';
import '../../../../shared/widgets/rating_badge.dart';
import '../../domain/entities/movie.dart';
import '../providers/movies_providers.dart';

class MovieDetailPage extends ConsumerWidget {
  const MovieDetailPage({super.key, required this.movieId, this.heroTag});

  final int movieId;
  final String? heroTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMovie = ref.watch(movieDetailProvider(movieId));

    return Scaffold(
      body: asyncMovie.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Scaffold(
          appBar: AppBar(),
          body: ErrorView(
            error: e,
            onRetry: () => ref.invalidate(movieDetailProvider(movieId)),
          ),
        ),
        data: (movie) => _DetailContent(movie: movie, heroTag: heroTag),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({required this.movie, required this.heroTag});

  final Movie movie;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 280,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              movie.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            background: _Backdrop(path: movie.backdropPath),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndMeta(movie: movie, heroTag: heroTag),
              if (movie.tagline != null && movie.tagline!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  '"${movie.tagline}"',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.white70,
                      ),
                ),
              ],
              if (movie.genres.isNotEmpty) ...[
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: movie.genres
                      .map((g) => Chip(label: Text(g)))
                      .toList(),
                ),
              ],
              const SizedBox(height: 24),
              Text('Sinopsis', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                movie.overview.isEmpty ? 'Sin sinopsis disponible.' : movie.overview,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                      color: Colors.white70,
                    ),
              ),
              const SizedBox(height: 32),
            ]),
          ),
        ),
      ],
    );
  }
}

class _Backdrop extends StatelessWidget {
  const _Backdrop({required this.path});
  final String? path;

  @override
  Widget build(BuildContext context) {
    final url = AppConfig.backdropUrl(path);
    return Stack(
      fit: StackFit.expand,
      children: [
        PosterImage(url: url, borderRadius: BorderRadius.zero),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.7),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PosterAndMeta extends StatelessWidget {
  const _PosterAndMeta({required this.movie, required this.heroTag});

  final Movie movie;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final poster = SizedBox(
      width: 120,
      height: 180,
      child: PosterImage(url: AppConfig.posterUrl(movie.posterPath)),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heroTag != null ? Hero(tag: heroTag!, child: poster) : poster,
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBadge(rating: movie.voteAverage),
              const SizedBox(height: 12),
              if (movie.releaseDate != null)
                _MetaRow(
                  icon: Icons.calendar_today,
                  text: DateFormat.yMMMM('es').format(movie.releaseDate!),
                ),
              if (movie.runtime != null) ...[
                const SizedBox(height: 8),
                _MetaRow(
                  icon: Icons.schedule,
                  text: _formatRuntime(movie.runtime!),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  String _formatRuntime(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    if (h == 0) return '${m}m';
    return '${h}h ${m}m';
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white60),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
