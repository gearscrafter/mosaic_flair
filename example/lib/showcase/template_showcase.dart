import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';
import 'templates/cart_template_showcase.dart';
import 'templates/catalog_template_showcase.dart';
import 'templates/contact_template_showcase.dart';
import 'templates/detail_template_showcase.dart';
import 'templates/home_template_showcase.dart';
import 'templates/login_template_showcase.dart';
import 'templates/register_template.dart';
import 'templates/search_template_showcase.dart';
import 'templates/support_template_showcase.dart';

/// `TemplateShowcase` es un widget sin estado (`StatelessWidget`) que representa una pantalla
/// para mostrar diferentes ejemplos de plantillas en la aplicación.
///
/// Las plantillas son vistas predefinidas que combinan múltiples organismos y moléculas
/// para formar estructuras de página completas.
class TemplateShowcase extends StatelessWidget {
  /// Constructor de `TemplateShowcase`.
  const TemplateShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de aplicaciones con el título de la página.
      appBar: AppBar(
        title: const Text('Templates Showcase'),
      ),

      /// Cuerpo de la página con desplazamiento y padding.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Elemento de la lista que navega a la pantalla `LoginTemplateShowcase`.
            ListTile(
              title: AppText(
                text: 'Login Template',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginTemplateShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `RegisterTemplateShowcase`.
            ListTile(
              title: AppText(
                text: 'Registro Template',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterTemplateShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `HomeTemplateShowcase`.
            ListTile(
              title: AppText(
                text: 'Home Template',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeTemplateShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `CatalogTemplateShowcase`.
            ListTile(
              title: AppText(
                text: 'Catalogo Template',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CatalogTemplateShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `SearchTemplateShowcase`.
            ListTile(
              title: AppText(
                text: 'Búsqueda Template',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchTemplateShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `DetailTemplateShowcase`.
            ListTile(
              title: AppText(
                text: 'Detalle del producto Template',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailTemplateShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `CartTemplateShowcase`.
            ListTile(
              title: AppText(
                text: 'Carrito de compras Template',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CartTemplateShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `ContactTemplateShowcase`.
            ListTile(
              title: AppText(
                text: 'Contacto Template',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContactTemplateShowcase()),
                );
              },
            ),

            /// Elemento de la lista que navega a la pantalla `SupportTemplateShowcase`.
            ListTile(
              title: AppText(
                text: 'Soporte Template',
                textColor: textColorPrimary,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SupportTemplateShowcase()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
