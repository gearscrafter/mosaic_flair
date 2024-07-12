import '../molecules/product_card.dart';

/// `Product` es una clase que representa un producto.
///
/// ### Atributos:
/// - `id`: El identificador único del producto (opcional).
/// - `name`: El nombre del producto.
/// - `description`: La descripción del producto.
/// - `image`: Una URL de la imagen del producto (opcional).
/// - `price`: El precio del producto.

class Product {
  /// El identificador único del producto (opcional).
  final int? id;

  /// El nombre del producto.
  final String name;

  /// La descripción del producto.
  final String description;

  /// Una URL de la imagen del producto (opcional).
  final String? image;

  /// El precio del producto.
  final double price;

  /// Constructor para crear una instancia de `Product`.
  Product({
    this.id,
    required this.name,
    required this.description,
    this.image,
    required this.price,
  });
}

/// `tileList` es una lista de tarjetas de productos (`ProductCard`) para mostrar productos de ejemplo.

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
