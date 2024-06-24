import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class ProductListShowcase extends StatefulWidget {
  const ProductListShowcase({super.key});

  @override
  State<ProductListShowcase> createState() => _ProductListShowcaseState();
}

class _ProductListShowcaseState extends State<ProductListShowcase> {
  bool _isScrolling = false;

  void _updateScrolling(bool isScrolling) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _isScrolling = isScrolling;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const AppText(text: 'Product List'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ProductList(
          onScrollChange: _updateScrolling,
          products: const [
            ProductCard(
              id: 1,
              title: 'Product 1',
              category: 'category',
              image: 'https://prd.place/400/600',
              price: 29.99,
            ),
            ProductCard(
              id: 1,
              title: 'Product 2',
              category: 'category',
              image: 'https://prd.place/400/600',
              price: 49.99,
            ),
            ProductCard(
              id: 1,
              title: 'Product 3',
              category: 'category',
              image: 'https://prd.place/400/600',
              price: 49.99,
            ),
            ProductCard(
              id: 1,
              title: 'Product 4',
              category: 'category',
              image: 'https://prd.place/400/600',
              price: 49.99,
            ),
            ProductCard(
              id: 1,
              title: 'Product 5',
              category: 'category',
              image: 'https://prd.place/400/600',
              price: 49.99,
            ),
            ProductCard(
              id: 1,
              title: 'Product 6',
              category: 'category',
              image: 'https://prd.place/400/600',
              price: 49.99,
            ),
            ProductCard(
              id: 1,
              title: 'Product 7',
              category: 'category',
              image: 'https://prd.place/400/600',
              price: 49.99,
            ),
            ProductCard(
              id: 1,
              title: 'Product 8',
              category: 'category',
              image: 'https://prd.place/400/600',
              price: 49.99,
            ),
            ProductCard(
              id: 1,
              title: 'Product 9',
              category: 'category',
              image: 'https://prd.place/400/600',
              price: 49.99,
            ),
          ],
        ),
      ),
    );
  }
}
