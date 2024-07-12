/// `CartItem` es una clase que representa un artículo en un carrito de compras.
///
/// ### Atributos:
/// - `id`: El identificador único del artículo.
/// - `name`: El nombre del artículo.
/// - `image`: Una URL de la imagen del artículo (opcional).
/// - `price`: El precio del artículo.
/// - `quantity`: La cantidad del artículo en el carrito.
library;

class CartItem {
  /// El identificador único del artículo.
  final int id;

  /// El nombre del artículo.
  final String name;

  /// Una URL de la imagen del artículo (opcional).
  final String? image;

  /// El precio del artículo.
  double price;

  /// La cantidad del artículo en el carrito.
  int quantity;

  /// Constructor para crear una instancia de `CartItem`.
  CartItem({
    required this.id,
    required this.name,
    this.image,
    required this.price,
    required this.quantity,
  });
}

/// `ProductQuantity` es una clase que representa la cantidad de un producto específico.
///
/// ### Atributos:
/// - `productId`: El identificador único del producto.
/// - `quantity`: La cantidad del producto.

class ProductQuantity {
  /// El identificador único del producto.
  int productId;

  /// La cantidad del producto.
  int quantity;

  /// Constructor para crear una instancia de `ProductQuantity`.
  ProductQuantity({
    required this.productId,
    required this.quantity,
  });
}
