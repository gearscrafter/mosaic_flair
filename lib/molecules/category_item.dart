import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final double categoryHeight;
  final Color color;

  const CategoryItem({
    required this.title,
    required this.categoryHeight,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: categoryHeight,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
