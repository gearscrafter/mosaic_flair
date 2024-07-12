import 'package:flutter/material.dart';

import '../data/cart_data.dart';
import '../organisms/cart_summary.dart';

/// `CartTemplate` es un widget que representa la plantilla del carrito de compras.
///
/// ### Atributos:
/// - `cartItems`: Una lista de elementos en el carrito.
/// - `onCheckout`: Función opcional que se ejecuta al realizar el pago.
/// - `onRemoveItem`: Función opcional que se ejecuta al eliminar un elemento del carrito.

class CartTemplate extends StatelessWidget {
  /// Una lista de elementos en el carrito.
  final List<CartItem> cartItems;

  /// Función opcional que se ejecuta al realizar el pago.
  final Function(List<ProductQuantity> products)? onCheckout;

  /// Función opcional que se ejecuta al eliminar un elemento del carrito.
  final Function(int index)? onRemoveItem;

  /// Constructor para crear una instancia de `CartTemplate`.
  const CartTemplate({
    super.key,
    required this.cartItems,
    this.onCheckout,
    this.onRemoveItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrito de compras',
        ),
        centerTitle: true,
      ),
      body: CartSummary(
        items: cartItems,
        onRemoveItem: onRemoveItem,
        onCheckout: onCheckout,
      ),
    );
  }
}
