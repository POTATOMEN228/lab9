import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final String category;
  final double rating;
  final double price;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.rating,
    required this.price,
  });

  /// Icon used as the product "avatar", chosen by category.
  IconData get icon {
    switch (category) {
      case 'Electronics':
        return Icons.headphones;
      case 'Books':
        return Icons.menu_book;
      case 'Sports':
        return Icons.sports_basketball;
      case 'Home':
        return Icons.chair;
      case 'Fashion':
        return Icons.checkroom;
      default:
        return Icons.shopping_bag;
    }
  }
}
