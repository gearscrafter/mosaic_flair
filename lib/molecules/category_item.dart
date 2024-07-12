import 'package:flutter/material.dart';

/// `CategoryItem` es un widget que representa un ítem de categoría con un título, una altura y un color.
///
/// ### Atributos:
/// - `title`: El título de la categoría.
/// - `categoryHeight`: La altura de la categoría.
/// - `color`: El color del texto del título.

class CategoryItem extends StatelessWidget {
  /// El título de la categoría.
  final String title;

  /// La altura de la categoría.
  final double categoryHeight;

  /// El color del texto del título.
  final Color color;

  /// Constructor para crear una instancia de `CategoryItem`.
  const CategoryItem({
    required this.title,
    required this.categoryHeight,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      /// Ancho del contenedor del ítem de categoría.
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
