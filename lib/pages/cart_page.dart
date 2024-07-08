import 'package:flutter/material.dart';
import '../data/cart_data.dart';
import '../templates/cart_template.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = [
      CartItem(
          id: 1,
          name: 'Product 1',
          image: 'https://via.placeholder.com/150',
          price: 29.99,
          quantity: 2),
      CartItem(
          id: 2,
          name: 'Product 2',
          image: 'https://via.placeholder.com/150',
          price: 49.99,
          quantity: 1),
    ];

    return CartTemplate(
      cartItems: cartItems,
    );
  }
}
