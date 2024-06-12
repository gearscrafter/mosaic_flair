import 'package:flutter/material.dart';
import 'package:atomic_design_system/atomic_design_system.dart';

class OrganismShowcase extends StatelessWidget {
  const OrganismShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisms Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Cart Summary'),
            const SizedBox(height: 8.0),
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
              ],
              onCheckout: null,
            ),
            const SizedBox(height: 16.0),
            const AppText('Login Form'),
            const SizedBox(height: 8.0),
            LoginForm(
                emailController: TextEditingController(),
                passwordController: TextEditingController(),
                onLogin: null),
            const SizedBox(height: 16.0),
            const AppText('Product Detail'),
            const SizedBox(height: 8.0),
            const ProductDetail(
              title: 'Product',
              description: 'Product Description',
              image: 'https://via.placeholder.com/300x200',
              price: 29.99,
            ),
            const SizedBox(height: 16.0),
            const Text('Product List'),
            const SizedBox(height: 8.0),
            const ProductList(
              products: [
                ProductCard(
                  title: 'Product 1',
                  image: 'https://via.placeholder.com/150',
                  price: 29.99,
                ),
                ProductCard(
                  title: 'Product 2',
                  image: 'https://via.placeholder.com/150',
                  price: 49.99,
                ),
                ProductCard(
                  title: 'Product 3',
                  image: 'https://via.placeholder.com/150',
                  price: 49.99,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
