import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Catalog'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Badge.count(
                  count: cartProvider.itemCount,
                  isLabelVisible: cartProvider.itemCount > 0,
                  child: IconButton(
                    key: const Key('cartButton'),
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final products = cartProvider.catalogProducts;
          return ListView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final product = products[index];
              final inCart = cartProvider.isInCart(product);

              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Icon(product.icon, color: Theme.of(context).colorScheme.primary),
                  ),
                  title: Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${product.category} • \$${product.price.toStringAsFixed(2)}'),
                  trailing: ElevatedButton.icon(
                    onPressed: () {
                      cartProvider.toggleCart(product);
                    },
                    icon: Icon(inCart ? Icons.check : Icons.add_shopping_cart, size: 18),
                    label: Text(inCart ? 'In Cart' : 'Add'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: inCart
                          ? Theme.of(context).colorScheme.secondaryContainer
                          : Theme.of(context).colorScheme.primaryContainer,
                      foregroundColor: inCart
                          ? Theme.of(context).colorScheme.onSecondaryContainer
                          : Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
