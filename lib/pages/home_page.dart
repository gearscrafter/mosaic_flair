import 'package:flutter/material.dart';

import '../molecules/carousel.dart';

class HomePage extends StatelessWidget {
  final List<Widget>? featuredProducts;
  final List<Widget>? carouselImages;
  const HomePage({this.featuredProducts, this.carouselImages, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppCarousel(
              items: carouselImages ?? [],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: featuredProducts ?? []),
            ),
          ],
        ),
      ),
    );
  }
}
