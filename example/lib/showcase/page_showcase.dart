import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class PageShowcase extends StatelessWidget {
  const PageShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pages Showcase'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Cart Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            ),
          ),
          ListTile(
            title: const Text('Catalog Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CatalogPage()),
            ),
          ),
          ListTile(
            title: const Text('Detail Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailPage()),
            ),
          ),
          ListTile(
            title: const Text('Home Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ),
          ),
          ListTile(
            title: const Text('Login Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            ),
          ),
          ListTile(
            title: const Text('Support Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SupportPage()),
            ),
          ),
        ],
      ),
    );
  }
}
