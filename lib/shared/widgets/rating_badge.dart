import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  const RatingBadge({super.key, required this.rating, this.compact = false});

  final double rating;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final color = _colorFor(rating);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 6 : 10,
        vertical: compact ? 2 : 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: compact ? 12 : 16, color: color),
          SizedBox(width: compact ? 2 : 4),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: compact ? 11 : 14,
            ),
          ),
        ],
      ),
    );
  }

  Color _colorFor(double rating) {
    if (rating >= 7.5) return const Color(0xFF21D07A);
    if (rating >= 5) return const Color(0xFFD2D531);
    return const Color(0xFFDB2360);
  }
}
