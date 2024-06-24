import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class CarouselShowcase extends StatelessWidget {
  const CarouselShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Carousel'),
          const SizedBox(height: 8.0),
          AppCarousel(
            height: 200,
            items: [
              Image.network('https://prd.place/400/600'),
              Image.network('https://prd.place/400/600'),
            ],
          ),
        ],
      ),
    );
  }
}
