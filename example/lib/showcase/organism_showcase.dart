import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';
import 'organism/cart_summary_showcase.dart';
import 'organism/login_form_showcase.dart';
import 'organism/product_detail_showcase.dart';
import 'organism/product_list_showcase.dart';
import 'organism/synchronous_tab_bar_showcase.dart';

/// `OrganismShowcase` es un widget sin estado (`StatelessWidget`) que representa una pantalla
/// para mostrar diferentes ejemplos de organismos en la aplicación.
///
/// Los organismos son componentes de UI más complejos que combinan múltiples moléculas para formar secciones funcionales de la UI.
class OrganismShowcase extends StatelessWidget {
  /// Constructor de `OrganismShowcase`.
  const OrganismShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de aplicaciones con el título de la página centrado.
      appBar: AppBar(
        title: const Text('Organisms Showcase'),
        centerTitle: true,
      ),

      /// Cuerpo de la página con desplazamiento y padding.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Elemento de la lista que navega a la pantalla `CartSummaryShowcase`.
            ListTile(
              title: AppText(
                text: 'Resumen de carrito de compras',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CartSummaryShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `LoginFormShowcase`.
            ListTile(
              title: AppText(
                text: 'Formulario de Login',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginFormShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `ProductDetailShowcase`.
            ListTile(
              title: AppText(
                text: 'Detalle del producto',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductDetailShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `ProductListShowcase`.
            ListTile(
              title: AppText(
                text: 'Listado de productos',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductListShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `SynchronousTabBarShowcase`.
            ListTile(
              title: AppText(
                text: 'TabBar productos',
                textColor: textColorPrimary,
              ),
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
