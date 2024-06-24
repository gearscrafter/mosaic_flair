import 'product_dart.dart';

class Category {
  final String? name;
  final List<Product>? products;
  Category({this.name, this.products});
  Category.none()
      : name = '',
        products = [];
}

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
