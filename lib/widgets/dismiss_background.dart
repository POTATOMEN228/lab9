import 'package:flutter/material.dart';

class DismissBackground extends StatelessWidget {
  final BorderRadius borderRadius;

  const DismissBackground({
    super.key,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: scheme.errorContainer,
        borderRadius: borderRadius,
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: Icon(
        Icons.delete_outline,
        color: scheme.onErrorContainer,
        size: 28,
      ),
    );
  }
}
