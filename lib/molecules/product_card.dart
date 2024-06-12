import 'package:flutter/material.dart';
import '../foundation/dimension_foundation.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final double price;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusDimensions),
      ),
      child: Column(
        children: [
          Image.network(image),
          Padding(
            padding: const EdgeInsets.all(paddingMediumDimension),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Text('\$$price', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
