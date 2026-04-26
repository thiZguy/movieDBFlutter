import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String url;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(12);

    if (url.isEmpty) {
      return _placeholder(context, radius);
    }

    return ClipRRect(
      borderRadius: radius,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        placeholder: (_, _) => _shimmer(context),
        errorWidget: (_, _, _) => _placeholder(context, radius),
      ),
    );
  }

  Widget _shimmer(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }

  Widget _placeholder(BuildContext context, BorderRadius radius) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: radius,
      ),
      child: const Icon(Icons.movie_outlined, size: 48, color: Colors.white24),
    );
  }
}
