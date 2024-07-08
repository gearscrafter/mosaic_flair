import 'package:flutter/material.dart';

import '../data/cart_data.dart';
import '../organisms/cart_summary.dart';

class CartTemplate extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(List<ProductQuantity> products)? onCheckout;

  const CartTemplate({
    super.key,
    required this.cartItems,
    this.onCheckout,
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
        onCheckout: onCheckout,
      ),
    );
  }
}
