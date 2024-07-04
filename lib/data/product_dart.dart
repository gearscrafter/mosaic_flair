import '../molecules/product_card.dart';

class Product {
  final int? id;
  final String name;
  final String description;
  final String? image;
  final double price;

  Product({
    this.id,
    required this.name,
    required this.description,
    this.image,
    required this.price,
  });
}

final tileList = [
  const ProductCard(
    id: 3,
    title: 'Product 1',
    category: 'category',
    image: null,
    price: 29.99,
  ),
  const ProductCard(
    id: 3,
    title: 'Product 2',
    category: 'category',
    image: null,
    price: 49.99,
  ),
  const ProductCard(
    id: 3,
    title: 'Product 3',
    category: 'category',
    image: null,
    price: 49.99,
  ),
  const ProductCard(
    id: 3,
    title: 'Product 4',
    category: 'category',
    image: null,
    price: 49.99,
  ),
  const ProductCard(
    id: 3,
    title: 'Product 5',
    category: 'category',
    image: null,
    price: 49.99,
  ),
  const ProductCard(
    id: 3,
    title: 'Product 6',
    category: 'category',
    image: null,
    price: 49.99,
  ),
  const ProductCard(
    id: 3,
    title: 'Product 7',
    category: 'category',
    image: null,
    price: 49.99,
  ),
  const ProductCard(
    id: 3,
    title: 'Product 8',
    category: 'category',
    image: null,
    price: 49.99,
  ),
  const ProductCard(
    id: 3,
    title: 'Product 9',
    category: 'category',
    image: 'https://prd.place/400/600',
    price: 49.99,
  ),
];
