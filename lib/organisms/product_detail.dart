import 'package:flutter/material.dart';

import '../atoms/button.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final double price;
  final VoidCallback? onAddToCart;

  const ProductDetail({
    super.key,
    required this.title,
    required this.description,
    this.image,
    required this.price,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image != null
            ? Image.network(image!,
                fit: BoxFit.cover, height: 200, width: double.infinity)
            : const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[600],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(description),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AppButton(
            label: 'Add to Cart',
            onPressed: onAddToCart,
          ),
        ),
      ],
    );
  }
}
