import 'product_dart.dart';

/// `Category` es una clase que representa una categoría de productos.
///
/// ### Atributos:
/// - `name`: El nombre de la categoría.
/// - `products`: Una lista de productos que pertenecen a la categoría.

class Category {
  /// El nombre de la categoría.
  final String? name;

  /// Una lista de productos que pertenecen a la categoría.
  final List<Product>? products;

  /// Constructor para crear una instancia de `Category`.
  Category({this.name, this.products});

  /// Constructor para crear una categoría vacía.
  Category.none()
      : name = '',
        products = [];
}

/// `categoriesItems` es una lista de categorías con productos de ejemplo.
final categoriesItems = [
  Category(name: 'category1', products: [
    Product(
        name: 'product',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
    Product(
        name: 'product',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
    Product(
        name: 'product',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
  ]),
  Category(name: 'category2', products: [
    Product(
        name: 'product1',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
    Product(
        name: 'product2',
        description: 'description',
        price: 20.0,
        image: 'https://prd.place/400/600'),
    Product(
        name: 'product',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
  ]),
  Category(name: 'category3', products: [
    Product(
        name: 'product',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
    Product(
        name: 'product',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
    Product(
        name: 'product',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
  ]),
  Category(name: 'category4', products: [
    Product(
        name: 'product',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
    Product(
        name: 'product',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
    Product(
        name: 'product5',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
    Product(
        name: 'product11',
        description: 'description',
        price: 10.0,
        image: 'https://prd.place/400/600'),
  ]),
];
