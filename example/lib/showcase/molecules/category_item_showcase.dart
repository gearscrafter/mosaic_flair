import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class CategoryItemShowcase extends StatelessWidget {
  const CategoryItemShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryItem(
      title: 'category',
      categoryHeight: 80,
      color: Colors.amber,
    );
  }
}
