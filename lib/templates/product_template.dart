import 'package:flutter/material.dart';

import '../organisms/product_detail.dart';

class ProductTemplate extends StatelessWidget {
  final Product? product;
  final VoidCallback? onAddToCart;

  const ProductTemplate({
    super.key,
    this.product,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product?.name ?? ''),
      ),
      body: ProductDetail(
        title: product?.name ?? '',
        description: product?.description ?? '',
        image: product?.image,
        price: product?.price ?? 0.0,
        onAddToCart: onAddToCart,
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String image;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });
}
