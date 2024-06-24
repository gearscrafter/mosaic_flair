import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class ProductCardShowcase extends StatelessWidget {
  const ProductCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Tarjeta de producto'),
              const SizedBox(height: 8.0),
              ProductCard(
                id: 1,
                title: 'Product',
                category: 'category',
                image: 'https://prd.place/400/600',
                price: 29.99,
                onTap: () {},
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
