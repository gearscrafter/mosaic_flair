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

class TemplateShowcase extends StatelessWidget {
  const TemplateShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Templates Showcase'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                title: const AppText(text: 'Login Template'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginTemplateShowcase()),
                  );
                },
              ),
              ListTile(
                title: const AppText(text: 'Registro Template'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterTemplateShowcase()),
                  );
                },
              ),
              ListTile(
                title: const AppText(text: 'Home Template'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeTemplateShowcase()),
                  );
                },
              ),
              ListTile(
                title: const AppText(text: 'Catalogo Template'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CatalogTemplateShowcase()),
                  );
                },
              ),
              ListTile(
                title: const AppText(text: 'Búsqueda Template'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchTemplateShowcase()),
                  );
                },
              ),
              ListTile(
                title: const AppText(text: 'Detalle del producto Template'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailTemplateShowcase()),
                  );
                },
              ),
              ListTile(
                title: const AppText(text: 'Carrito de compras Template'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartTemplateShowcase()),
                  );
                },
              ),
              ListTile(
                title: const AppText(text: 'Contacto Template'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactTemplateShowcase()),
                  );
                },
              ),
              ListTile(
                title: const AppText(text: 'Soporte Template'),
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
        ));
  }
}
