import 'package:flutter/material.dart';
import '../organisms/cart_summary.dart';
import '../templates/cart_template.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = [
      CartItem(
          name: 'Product 1',
          image: 'https://via.placeholder.com/150',
          price: 29.99,
          quantity: 2),
      CartItem(
          name: 'Product 2',
          image: 'https://via.placeholder.com/150',
          price: 49.99,
          quantity: 1),
    ];

    return CartTemplate(
      cartItems: cartItems,
      onCheckout: () {
        // Handle checkout
      },
    );
  }
}
