import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final bool onSelected;
  final Color color;

  const CategoryCard({
    required this.title,
    required this.onSelected,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onSelected ? 1 : 0.5,
      child: SizedBox(
        width: 150,
        child: Card(
          elevation: onSelected ? 6 : 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
