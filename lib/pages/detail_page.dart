import 'package:flutter/material.dart';

import '../templates/product_template.dart';

class DetailPage extends StatelessWidget {
  final Product? product;
  final VoidCallback? onAddToCart;

  const DetailPage({this.product, this.onAddToCart, super.key});

  @override
  Widget build(BuildContext context) {
    return ProductTemplate(product: product, onAddToCart: onAddToCart);
  }
}
