import 'category_data.dart';
import 'product_dart.dart';

/// `Item` es una clase que representa un ítem que puede ser una categoría o un producto.
///
/// ### Atributos:
/// - `category`: Una instancia de la clase `Category` (puede ser nula).
/// - `product`: Una instancia de la clase `Product` (puede ser nula).
class Item {
  /// Una instancia de la clase `Category` (puede ser nula).
  final Category? category;

  /// Una instancia de la clase `Product` (puede ser nula).
  final Product? product;

  /// Constructor para crear una instancia de `Item`.
  Item({this.category, this.product});

  /// Propiedad que indica si el ítem es una categoría.
  bool get isCategory => category != null;
}
