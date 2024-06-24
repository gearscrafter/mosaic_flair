import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

import 'organism/cart_summary_showcase.dart';
import 'organism/login_form_showcase.dart';
import 'organism/product_detail_showcase.dart';
import 'organism/product_list_showcase.dart';
import 'organism/synchronous_tab_bar_showcase.dart';

class OrganismShowcase extends StatelessWidget {
  const OrganismShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisms Showcase'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const AppText(text: 'Resumen de carrito de compras'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CartSummaryShowcase()),
                );
              },
            ),
            ListTile(
              title: const AppText(text: 'Formulario de Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginFormShowcase()),
                );
              },
            ),
            ListTile(
              title: const AppText(text: 'Detalle del producto'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductDetailShowcase()),
                );
              },
            ),
            ListTile(
              title: const AppText(text: 'Listado de productos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductListShowcase()),
                );
              },
            ),
            ListTile(
              title: const AppText(text: 'TabBar productos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SynchronousTabBarShowcase()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
