import 'package:flutter/material.dart';

/// `CategoryCard` es un widget que representa una tarjeta de categoría con un título, un estado de selección y un color.
///
/// ### Atributos:
/// - `title`: El título de la categoría.
/// - `onSelected`: Indica si la tarjeta está seleccionada.
/// - `color`: El color del texto del título.

class CategoryCard extends StatelessWidget {
  /// El título de la categoría.
  final String title;

  /// Indica si la tarjeta está seleccionada.
  final bool onSelected;

  /// El color del texto del título.
  final Color color;

  /// Constructor para crear una instancia de `CategoryCard`.
  const CategoryCard({
    required this.title,
    required this.onSelected,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      /// Ajusta la opacidad de la tarjeta según su estado de selección.
      opacity: onSelected ? 1 : 0.5,
      child: SizedBox(
        width: 150,
        child: Card(
          /// Ajusta la elevación de la tarjeta según su estado de selección.
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
