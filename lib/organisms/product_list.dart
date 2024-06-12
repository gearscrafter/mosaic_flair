import 'package:flutter/material.dart';

import '../molecules/product_card.dart';

class ProductList extends StatelessWidget {
  final List<ProductCard> products;

  const ProductList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return products[index];
        },
      ),
    );
  }
}
