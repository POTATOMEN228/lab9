import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final VoidCallback onReset;

  const EmptyState({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inventory_2_outlined, size: 96, color: scheme.outline),
            const SizedBox(height: 16),
            Text(
              'Catalog is Empty',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'You have removed every item.',
              style: TextStyle(color: scheme.outline),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onReset,
              icon: const Icon(Icons.restore),
              label: const Text('Reset Catalog'),
            ),
          ],
        ),
      ),
    );
  }
}
