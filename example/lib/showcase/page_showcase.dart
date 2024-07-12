import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

/// `PageShowcase` es un widget sin estado (`StatelessWidget`) que representa una pantalla
/// para mostrar diferentes ejemplos de páginas en la aplicación.
///
/// Las páginas son vistas completas que combinan varios organismos, moléculas y átomos
/// para proporcionar una funcionalidad completa y específica.
class PageShowcase extends StatelessWidget {
  /// Constructor de `PageShowcase`.
  const PageShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de aplicaciones con el título de la página.
      appBar: AppBar(
        title: const Text('Pages Showcase'),
      ),

      /// Cuerpo de la página que contiene una lista de elementos con padding.
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          /// Elemento de la lista que navega a la pantalla `CartPage`.
          ListTile(
            title: const Text('Cart Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            ),
          ),

          /// Elemento de la lista que navega a la pantalla `CatalogPage`.
          ListTile(
            title: const Text('Catalog Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CatalogPage()),
            ),
          ),

          /// Elemento de la lista que navega a la pantalla `DetailPage`.
          ListTile(
            title: const Text('Detail Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailPage()),
            ),
          ),

          /// Elemento de la lista que navega a la pantalla `HomePage`.
          ListTile(
            title: const Text('Home Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ),
          ),

          /// Elemento de la lista que navega a la pantalla `LoginPage`.
          ListTile(
            title: const Text('Login Page'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            ),
          ),

          /// Elemento de la lista que navega a la pantalla `SupportPage`.
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
