import 'package:flutter/material.dart';
import '../templates/catalog_template.dart';
import '../molecules/product_card.dart';

class CatalogPage extends StatelessWidget {
  final List<ProductCard>? products;
  final void Function(ProductCard? product)? onProductTap;
  const CatalogPage({this.products, this.onProductTap, super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogTemplate(
      products: products ?? [],
      onProductTap: onProductTap,
    );
  }
}
