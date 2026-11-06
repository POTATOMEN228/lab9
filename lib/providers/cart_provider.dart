import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _catalogProducts = [
    const Product(
      id: 'p1',
      title: 'Wireless Headphones',
      category: 'Electronics',
      rating: 4.8,
      price: 129.99,
      icon: Icons.headphones,
    ),
    const Product(
      id: 'p2',
      title: 'Smart Watch',
      category: 'Electronics',
      rating: 4.6,
      price: 199.99,
      icon: Icons.watch,
    ),
    const Product(
      id: 'p3',
      title: 'Running Shoes',
      category: 'Sports',
      rating: 4.7,
      price: 89.99,
      icon: Icons.sports_basketball,
    ),
    const Product(
      id: 'p4',
      title: 'Ergonomic Chair',
      category: 'Home',
      rating: 4.9,
      price: 249.99,
      icon: Icons.chair,
    ),
    const Product(
      id: 'p5',
      title: 'Flutter Design Book',
      category: 'Books',
      rating: 4.9,
      price: 39.99,
      icon: Icons.menu_book,
    ),
    const Product(
      id: 'p6',
      title: 'Casual Backpack',
      category: 'Fashion',
      rating: 4.5,
      price: 59.99,
      icon: Icons.checkroom,
    ),
  ];

  final List<Product> _cartItems = [];

  List<Product> get catalogProducts => List.unmodifiable(_catalogProducts);
  List<Product> get cartItems => List.unmodifiable(_cartItems);

  int get itemCount => _cartItems.length;

  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + item.price);
  }

  bool isInCart(Product product) {
    return _cartItems.any((item) => item.id == product.id);
  }

  void toggleCart(Product product) {
    if (isInCart(product)) {
      _cartItems.removeWhere((item) => item.id == product.id);
    } else {
      _cartItems.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
