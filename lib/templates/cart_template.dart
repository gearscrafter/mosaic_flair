import 'package:flutter/material.dart';

import '../organisms/cart_summary.dart';

class CartTemplate extends StatelessWidget {
  final List<CartItem> cartItems;
  final VoidCallback onCheckout;

  const CartTemplate({
    super.key,
    required this.cartItems,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: CartSummary(
        items: cartItems,
        onCheckout: onCheckout,
      ),
    );
  }
}
