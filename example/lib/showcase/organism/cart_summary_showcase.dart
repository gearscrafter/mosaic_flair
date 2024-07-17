import 'package:flutter/material.dart';
import 'package:mosaic_flair/data/cart_data.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class CartSummaryShowcase extends StatelessWidget {
  const CartSummaryShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: AppText(
          text: 'Cart Summary',
          textColor: textColorPrimary,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CartSummary(
            items: [
              CartItem(
                id: 1,
                name: 'Product 1',
                image: 'https://via.placeholder.com/150',
                price: 29.99,
                quantity: 2,
              ),
              CartItem(
                id: 2,
                name: 'Product 2',
                image: 'https://via.placeholder.com/150',
                price: 49.99,
                quantity: 1,
              ),
              CartItem(
                id: 3,
                name: 'Product 2',
                image: 'https://via.placeholder.com/150',
                price: 49.99,
                quantity: 1,
              ),
              CartItem(
                id: 4,
                name: 'Product 2',
                image: 'https://via.placeholder.com/150',
                price: 49.99,
                quantity: 1,
              ),
              CartItem(
                id: 5,
                name: 'Product 2',
                image: 'https://via.placeholder.com/150',
                price: 49.99,
                quantity: 1,
              ),
            ],
            onCheckout: null,
          ),
        ],
      ),
    );
  }
}
