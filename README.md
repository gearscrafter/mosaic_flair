[![pub package](https://img.shields.io/pub/v/mosaic_flair.svg)](https://pub.dev/packages/mosaic_flair)
[![GitHub license](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/gearscrafter/mosaic_flair/blob/main/LICENSE)

# Mosaic Flair
Este paquete proporciona un sistema de diseño modular basado en los principios de Atomic Design. Incluye componentes reusables, y plantillas para construir aplicaciones Flutter consistentes y escalables.

## 📖 Índice
1. [Descripción](#descripcion)
2. [Instalación](#instalacion)
3. [Uso Básico](#uso)
3. [Estructura del Paquete](#estructura)
4. [Ejemplo de Showcase](#ejemplo)
4. [Contribuir](#contribuir)
5. [Licencia](#licencia)

<a name="descripcion"></a>
## Descripción

El `Mosaic Flair` facilita la construcción de interfaces de usuario con componentes reutilizables organizados en átomos, moléculas, organismos, y plantillas. Este sistema de diseño ayuda a mantener la consistencia visual y la escalabilidad de tu aplicación Flutter.


### Atomic Design
- `Átomos:` Componentes básicos e indivisibles (botones, íconos, etc.).

- `Moléculas:` Combinaciones de átomos que forman unidades funcionales.

- `Organismos:` Combinaciones complejas de moléculas que constituyen partes de la interfaz.

- `Plantillas:` Estructuras de páginas que sirven de base para diferentes vistas.

- `Páginas:` Instancias concretas y específicas que usan plantillas y otros componentes.

<a name="instalacion"></a>
## Instalación
Para añadir este paquete a tu proyecto Flutter, agrega el siguiente código a tu archivo `pubspec.yaml`:

```
dependencies:
  mosaic_flair: ^0.0.1
```
Luego, ejecuta:

```
flutter pub get
```
<a name="uso"></a>
## Uso Básico
Aquí tienes un ejemplo básico de cómo utilizar el paquete:

### Ejemplo de componente Atómico
```
import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class AtomShowcase extends StatelessWidget {
  const AtomShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atoms Showcase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Buttons'),
            const SizedBox(height: 8.0),
            const AppButton(
              onPressed: null,
              label: 'Disabled Button',
            ),
            const SizedBox(height: 8.0),
            AppButton(
              onPressed: () {},
              label: 'Enabled Button',
            ),
            const SizedBox(height: 16.0),
            const AppText('Icons'),
            const SizedBox(height: 8.0),
            const AppIcon(
              iconData: Icons.star,
            ),
            const SizedBox(height: 8.0),
            const AppText('Input Fields'),
            const SizedBox(height: 8.0),
            AppInput(
                controller: TextEditingController(text: ''),
                hintText: 'Enter text'),
            const SizedBox(height: 16.0),
            const AppText('Texts'),
            const SizedBox(height: 8.0),
            const AppText('Sample Text'),
          ],
        ),
      ),
    );
  }
}
```
### Ejemplo de componente Molécula
```
import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class MoleculeShowcase extends StatelessWidget {
  const MoleculeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Molecules Showcase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Navigation Bar'),
            const SizedBox(height: 8.0),
            AppNavigationBar(
              currentIndex: 0,
              onTap: (index) {
                print(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home)),
                BottomNavigationBarItem(icon: Icon(Icons.call)),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('Product Card'),
            const SizedBox(height: 8.0),
            ProductCard(
              title: 'Product',
              image: 'https://via.placeholder.com/150',
              price: 29.99,
              onTap: () {
                print("presionaste el producto");
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Search Bar'),
            const SizedBox(height: 8.0),
            SearchBarM(
              controller: TextEditingController(text: 'buscando...'),
              hintText: 'buscador',
            ),
            const SizedBox(height: 16.0),
            const Text('Carousel'),
            const SizedBox(height: 8.0),
            AppCarousel(
              height: 200,
              items: [
                Image.network('https://via.placeholder.com/300x200'),
                Image.network('https://via.placeholder.com/300x200'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```
### Ejemplo de componente Organismo
```
import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class OrganismShowcase extends StatelessWidget {
  const OrganismShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisms Showcase'),
      ),
      body: Padding(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```
### Ejemplo de componente Página
```
import 'package:mosaic_flair/pages/cart_page.dart';
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
```
<a name="estructura"></a>
## Estructura del Paquete
El paquete está organizado según los principios de Atomic Design:
```
lib/
├── mosaic_flair.dart  # Archivo de biblioteca principal
├── atoms/                     # Componentes básicos
│   ├── button.dart
│   ├── icon.dart
│   ├── input.dart
│   └── text.dart
├── foundation/                # Fundaciones de diseño
│   ├── color_foundation.dart
│   ├── dimension_foundation.dart
│   ├── duration_foundation.dart
│   ├── icon_foundation.dart
│   ├── radius_foundation.dart
│   ├── spacing_foundation.dart
│   ├── theme_foundation.dart
│   └── typography_foundation.dart
├── molecules/                 # Combinaciones de átomos
│   ├── carousel.dart
│   ├── navigation.dart
│   ├── product_card.dart
│   └── search_bar.dart
├── organisms/                 # Combinaciones de moléculas
│   ├── cart_summary.dart
│   ├── login_form.dart
│   ├── product_detail.dart
│   └── product_list.dart
├── templates/                 # Estructuras de página
│   ├── cart_template.dart
│   ├── product_template.dart
│   ├── search_template.dart
│   └── support_template.dart
└── tokens/                    # Tokens de diseño
    ├── colors.dart
    ├── dimensions.dart
    ├── duration.dart
    ├── icons.dart
    ├── radius.dart
    ├── spacing.dart
    ├── themes.dart
    └── typography.dart
```
<a name="ejemplo"></a>
## Ejemplo de Showcase
Para ejecutar el ejemplo de showcase, sigue estos pasos:

1. Navega a la carpeta showcase en tu terminal.

2. Instala las dependencias:
```
flutter pub get
```
3. Ejecuta la aplicación:
```
flutter run
```
Esto abrirá una aplicación que muestra cómo utilizar cada componente del sistema de diseño, incluyendo átomos, moléculas, organismos, plantillas y páginas.

<a name="contribuir"></a>
## Contribuir

Si deseas contribuir a este proyecto:

1. Haz un fork del repositorio.
2. Crea una rama nueva para tu feature (git checkout -b feature/nueva-feature).
3. Haz commit de tus cambios (git commit -m 'Añadir nueva feature').
4. Sube tu rama (git push origin feature/nueva-feature).
5. Abre un Pull Request.

<a name="licencia"></a>
## Licencia

Este proyecto está bajo la Licencia MIT. Para más detalles, consulta el archivo LICENSE.