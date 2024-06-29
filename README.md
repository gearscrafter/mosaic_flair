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
5. [Tests](#tests)
6. [Demo](#demo)
7. [Contribuir](#contribuir)
8. [Licencia](#licencia)

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
Aquí tienes la pantalla principal del paquete:

### Ejemplo 
```
import 'package:flutter/material.dart';

import 'showcase/atom_showcase.dart';
import 'showcase/molecule_showcase.dart';
import 'showcase/organism_showcase.dart';
import 'showcase/page_showcase.dart';
import 'showcase/template_showcase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mosaic Flair Showcase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShowcaseHomePage(),
    );
  }
}

class ShowcaseHomePage extends StatelessWidget {
  const ShowcaseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mosaic Flair Showcase'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Atoms Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AtomsShowcase()),
            ),
          ),
          ListTile(
            title: const Text('Molecules Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MoleculeShowcase()),
            ),
          ),
          ListTile(
            title: const Text('Organisms Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrganismShowcase()),
            ),
          ),
          ListTile(
            title: const Text('Templates Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TemplateShowcase()),
            ),
          ),
          ListTile(
            title: const Text('Pages Showcase'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PageShowcase()),
            ),
          ),
        ],
      ),
    );
  }
}
```
<a name="tests"></a>
## Tests
Para ejecutar los tests widgets y de integración, ejecuta el siguiente script:
```
./run_all_tests.sh
```
### Informe de covertura
![Imagen](/assets/images/coverage.png)

Para abrir el test de cobertura, ejecuta el siguiente comando:
```
open coverage/html/index.html
```
<a name="demo"></a>
## Demo

### Atomos
![Imagen](/assets/clips/atoms_clip.gif)

### Moleculas
![Imagen](/assets/clips/molecules_clip.gif)

### Organismos
![Imagen](/assets/clips/organism_clip.gif)

### Templates
![Imagen](/assets/clips/template_clip.gif)

### Paginas
![Imagen](/assets/clips/page_clip.gif)

<a name="estructura"></a>
## Estructura del Paquete
El paquete está organizado según los principios de Atomic Design:
```
lib/
├── mosaic_flair.dart  # Archivo de biblioteca principal
├── atoms/                     # Componentes básicos
│   ├── button.dart
│   ├── icon.dart
│   ├── dropdownbutton.dart
│   ├── input.dart
│   ├── process_button.dart
│   ├── support.dart
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
│   ├── appbar.dart
│   ├── carousel.dart
│   ├── menu.dart
│   ├── product_card.dart
│   ├── promotion_card.dart
│   ├── tile_card.dart
│   └── search_bar.dart
├── organisms/                 # Combinaciones de moléculas
│   ├── cart_summary.dart
│   ├── login_form.dart
│   ├── product_detail.dart
│   ├── register_form.dart
│   ├── synchronous_tab_bar.dart
│   └── product_list.dart
├── templates/                 # Estructuras de página
│   ├── cart_template.dart
│   ├── product_template.dart
│   ├── catalog_template.dart
│   ├── contact_template.dart
│   ├── detail_template.dart
│   ├── home_template.dart
│   ├── login_template.dart
│   ├── register_template.dart
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