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
        title: const AppText(
          text: 'Cart Summary',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CartSummary(
            items: [
              CartItem(
                name: 'Product 1',
                image: 'https://via.placeholder.com/150',
                price: 29.99,
                quantity: 2,
              ),
              CartItem(
                name: 'Product 2',
                image: 'https://via.placeholder.com/150',
                price: 49.99,
                quantity: 1,
              ),
              CartItem(
                name: 'Product 2',
                image: 'https://via.placeholder.com/150',
                price: 49.99,
                quantity: 1,
              ),
              CartItem(
                name: 'Product 2',
                image: 'https://via.placeholder.com/150',
                price: 49.99,
                quantity: 1,
              ),
              CartItem(
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
