import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class CategoryCardShowcase extends StatelessWidget {
  const CategoryCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryCard(
      color: Colors.white,
      onSelected: true,
      title: 'category',
    );
  }
}
