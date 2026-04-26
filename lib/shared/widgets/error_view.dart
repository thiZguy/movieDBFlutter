import 'package:flutter/material.dart';

import '../../core/error/exceptions.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.error, this.onRetry});

  final Object error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 56, color: Colors.white54),
            const SizedBox(height: 16),
            Text(
              _title(error),
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              _detail(error),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white60,
                  ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _title(Object error) {
    return switch (error) {
      NetworkException() => 'Sin conexión',
      TimeoutException() => 'Tiempo agotado',
      UnauthorizedException() => 'API key inválida',
      NotFoundException() => 'No encontrado',
      ServerException() => 'Error del servidor',
      _ => 'Algo salió mal',
    };
  }

  String _detail(Object error) {
    if (error is AppException) return error.message;
    return error.toString();
  }
}
