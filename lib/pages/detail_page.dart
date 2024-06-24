import 'package:flutter/material.dart';

import '../data/product_dart.dart';
import '../templates/detail_template.dart';

class DetailPage extends StatelessWidget {
  final Product? product;
  final Function(Product? product, int quantity)? onAddToCart;

  const DetailPage({this.product, this.onAddToCart, super.key});

  @override
  Widget build(BuildContext context) {
    return DetailsTemplate(product: product, onAddToCart: onAddToCart);
  }
}
