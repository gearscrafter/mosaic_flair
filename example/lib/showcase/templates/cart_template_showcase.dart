import 'package:flutter/material.dart';
import 'package:mosaic_flair/data/cart_data.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class CartTemplateShowcase extends StatelessWidget {
  const CartTemplateShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = [
      CartItem(
          name: 'Product 1',
          image: 'https://prd.place/400/600',
          price: 29.99,
          quantity: 2),
      CartItem(
          name: 'Product 2',
          image: 'https://prd.place/400/600',
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
