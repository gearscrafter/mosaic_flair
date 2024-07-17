import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class ProductDetailShowcase extends StatelessWidget {
  const ProductDetailShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: AppText(
          text: 'Product Detail',
          textColor: textColorPrimary,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductDetail(
                title: 'Product',
                description: 'Product Description',
                image: 'https://prd.place/400/600',
                price: 29.99,
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
