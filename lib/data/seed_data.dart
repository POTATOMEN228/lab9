import '../models/product.dart';

/// Initial catalog (also used by the "Reset Catalog" button).
List<Product> buildSeedProducts() => [
  const Product(id: 1, title: 'Wireless Headphones', category: 'Electronics', rating: 4.6, price: 89.99),
  const Product(id: 2, title: 'Clean Code', category: 'Books', rating: 4.8, price: 34.50),
  const Product(id: 3, title: 'Running Shoes', category: 'Sports', rating: 4.3, price: 74.00),
  const Product(id: 4, title: 'Office Chair', category: 'Home', rating: 4.1, price: 159.00),
  const Product(id: 5, title: 'Denim Jacket', category: 'Fashion', rating: 4.4, price: 62.90),
  const Product(id: 6, title: 'Smart Watch', category: 'Electronics', rating: 4.5, price: 129.99),
  const Product(id: 7, title: 'Yoga Mat', category: 'Sports', rating: 4.2, price: 24.99),
  const Product(id: 8, title: 'Table Lamp', category: 'Home', rating: 4.0, price: 39.90),
  const Product(id: 9, title: 'Flutter in Action', category: 'Books', rating: 4.7, price: 42.00),
  const Product(id: 10, title: 'Sneakers', category: 'Fashion', rating: 4.5, price: 95.00),
  const Product(id: 11, title: 'Bluetooth Speaker', category: 'Electronics', rating: 4.3, price: 55.00),
  const Product(id: 12, title: 'Dumbbell Set', category: 'Sports', rating: 4.6, price: 110.00),
];

const int kSeedCount = 12;

/// Generates a "new" product that arrives from the fake network request.
Product generateNewProduct(int id) {
  const titles = [
    'Mechanical Keyboard',
    'Backpack Pro',
    'Desk Organizer',
    'Fitness Band',
    'Sci-Fi Novel',
    'Winter Scarf',
    'Gaming Mouse',
    'Coffee Grinder',
  ];
  const categories = ['Electronics', 'Fashion', 'Home', 'Sports', 'Books'];

  return Product(
    id: id,
    title: '${titles[id % titles.length]} #$id',
    category: categories[id % categories.length],
    rating: 3.5 + (id % 15) / 10, // 3.5 .. 4.9
    price: 19.99 + (id * 7 % 120),
  );
}
