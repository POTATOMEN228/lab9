import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../data/seed_data.dart';
import '../models/product.dart';
import '../widgets/dismiss_background.dart';
import '../widgets/empty_state.dart';
import '../widgets/product_grid_card.dart';
import '../widgets/product_list_tile.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Product> _products = buildSeedProducts();
  bool _isGrid = false;
  int _nextId = kSeedCount + 1;

  // ---------------------------------------------------------------- actions

  /// Pull-to-Refresh: fake 1.5 s network call, then prepend a new item.
  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    setState(() {
      _products.insert(0, generateNewProduct(_nextId++));
    });
  }

  /// Swipe-to-Delete: remove the item and offer UNDO at the same index.
  void _deleteProduct(int index) {
    final removed = _products[index];

    setState(() => _products.removeAt(index));

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Товар "${removed.title}" удален'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'Отменить',
            onPressed: () {
              setState(() {
                // min() protects against a shorter list after other changes.
                _products.insert(math.min(index, _products.length), removed);
              });
            },
          ),
        ),
      );
  }

  void _resetCatalog() {
    setState(() {
      _products = buildSeedProducts();
      _nextId = kSeedCount + 1;
    });
  }

  // ------------------------------------------------------------------ views

  /// Wraps any item into a Dismissible (right-to-left, red delete background).
  Widget _dismissible(int index, Widget child, {BorderRadius? radius}) {
    final product = _products[index];
    return Dismissible(
      key: ValueKey(product.id), // mandatory unique key
      direction: DismissDirection.endToStart,
      background: DismissBackground(
        borderRadius: radius ?? BorderRadius.zero,
      ),
      onDismissed: (_) => _deleteProduct(index),
      child: child,
    );
  }

  Widget _buildList() {
    return ListView.separated(
      // Always scrollable so pull-to-refresh works even with few items.
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: _products.length,
      separatorBuilder: (_, index) => const Divider(height: 1, thickness: 0.5),
      itemBuilder: (context, index) => _dismissible(
        index,
        ProductListTile(product: _products[index]),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) => _dismissible(
        index,
        ProductGridCard(product: _products[index]),
        radius: BorderRadius.circular(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Catalog (${_products.length})'),
        actions: [
          IconButton(
            tooltip: _isGrid ? 'Show as list' : 'Show as grid',
            icon: Icon(_isGrid ? Icons.view_list : Icons.grid_view),
            onPressed: () => setState(() => _isGrid = !_isGrid),
          ),
        ],
      ),
      body: _products.isEmpty
          ? EmptyState(onReset: _resetCatalog)
          : RefreshIndicator(
        onRefresh: _handleRefresh,
        child: _isGrid ? _buildGrid() : _buildList(),
      ),
    );
  }
}
