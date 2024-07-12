import 'category_data.dart';

/// `TabCategory` es una clase que representa una categoría en una pestaña con su estado de selección y desplazamiento.
///
/// ### Atributos:
/// - `category`: La categoría asociada a la pestaña.
/// - `onSelected`: Indica si la pestaña está seleccionada.
/// - `offsetFrom`: El desplazamiento inicial de la pestaña.
/// - `offsetTo`: El desplazamiento final de la pestaña.

class TabCategory {
  /// La categoría asociada a la pestaña.
  final Category category;

  /// Indica si la pestaña está seleccionada.
  final bool onSelected;

  /// El desplazamiento inicial de la pestaña.
  final double offsetFrom;

  /// El desplazamiento final de la pestaña.
  final double offsetTo;

  /// Constructor para crear una instancia de `TabCategory`.
  TabCategory({
    required this.category,
    required this.onSelected,
    required this.offsetFrom,
    required this.offsetTo,
  });

  /// Método para copiar una instancia de `TabCategory` con un nuevo valor para `onSelected`.
  TabCategory copyWith(bool onSelected) => TabCategory(
      category: category,
      onSelected: onSelected,
      offsetFrom: offsetFrom,
      offsetTo: offsetTo);
}
