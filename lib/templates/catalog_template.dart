import 'package:flutter/material.dart';
import '../molecules/product_card.dart';

class CatalogTemplate extends StatelessWidget {
  final List<ProductCard>? products;
  final void Function(ProductCard? product)? onProductTap;

  const CatalogTemplate({
    super.key,
    this.products,
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
      ),
      body: ListView.builder(
        itemCount: products?.length,
        itemBuilder: (context, index) {
          final product = products?[index];
          return GestureDetector(
            onTap: () {
              if (onProductTap != null) {
                onProductTap!(product);
              }
            },
            child: product,
          );
        },
      ),
    );
  }
}
