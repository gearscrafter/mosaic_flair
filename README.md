[![pub package](https://img.shields.io/pub/v/mosaic_flair.svg)](https://pub.dev/packages/mosaic_flair)
[![GitHub license](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/gearscrafter/mosaic_flair/blob/main/LICENSE)

# Mosaic Flair
Este paquete proporciona un sistema de diseño modular basado en los principios de Atomic Design. Incluye componentes reusables, y plantillas para construir aplicaciones Flutter consistentes y escalables.

## 📖 Índice
1. [Descripción](#descripcion)
2. [Instalación](#instalacion)
3. [Uso Básico](#uso)
4. [Accesibilidad](#accesibilidad)
5. [Estructura del Paquete](#estructura)
6. [Ejemplo de Showcase](#ejemplo)
7. [Tests](#tests)
8. [Demo](#demo)
9. [Contribuir](#contribuir)
10. [Licencia](#licencia)

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

```yaml
dependencies:
  mosaic_flair: ^0.0.1
```
Luego, ejecuta:

```
flutter pub get
```
<a name="uso"></a>
## Uso Básico
### Parametrización de la Aplicación con JSON
Para parametrizar tu aplicación con datos provenientes de un archivo JSON, sigue los siguientes pasos:

#### 1. Creación del Archivo JSON:
Crea un archivo JSON que contenga las configuraciones, y agregala a una carpeta json y utilizalo en el pubspec. 

```yaml
  assets:
    - assets/app_config.json
```

Utiliza este json, y reemplaza el valor que contenga la llave:

```json
{
  "durations": {
    "short": 200,
    "medium": 400,
    "long": 600
  },
  "paddingSmall": 8.0,
  "paddingMedium": 16.0,
  "paddingLarge": 24.0,
  "fontSizeSmall": 14.0,
  "fontSizeMedium": 18.0,
  "fontSizeLarge": 24.0,
  "borderRadius": 8.0,
  "mainLoginLabel": "Bienvenido",
  "withoutAccountLabel": "¿Aún no tienes una cuenta?",
  "userLoginLabel": "Username",
  "passwordLoginLabel": "Password",
  "buttonLoginLabel": "Login",
  "mainRegisterLabel": "Registrate",
  "emailRegisterLabel": "Email",
  "nicknameRegisterLabel": "Nombre de usuario",
  "passwordRegisterLabel": "Password",
  "userRegisterLabel": "Nombres",
  "lastnameRegisterLabel": "Apellidos",
  "cellphoneRegisterLabel": "Telefono",
  "buttonRegisterLabel": "Registrarse",
  "greetingsLabel": "Hola, ",
  "orderYourProductLabel": "Ordena tu producto favorito",
  "popularSectionLabel": "Popular",
  "seeMoreSectionLabel": "Ver más",
  "menuLabel": "Menu",
  "homeLabel": "Home",
  "productLabel": "Productos",
  "supportLabel": "Soporte",
  "contactLabel": "Contacto",
  "mainCartLabel": "Carrito de compras",
  "payLabel": "Pagar",
  "totalLabel": "Total",
  "amountLabel": "Cantidad",
  "mainContactLabel": "Contáctanos",
  "descriptionContactLabel": "Si tienes sugerencias, contáctate con nosotros.\n\nEstamos felices de ayudarte!!",
  "phoneContactLabel": "+ 31 20 123 4501",
  "emailContactLabel": "contactos@creative.com",
  "mainSupportLabel": "Ayuda y Soporte",
  "descriptionSupportLabel": "Bienvenido a nuestro espacio de Ayuda y Soporte.",
  "secondarySupportLabel": "Nuestros horarios de servicio",
  "questionSupportLabel": "¿No encontraste la respuesta a tu pregunta?",
  "emailDescriptionSupportLabel": "Envíanos un correo",
  "phoneDescriptionSupportLabel": "Llámanos",
  "messageDescriptionSupportLabel": "Envíanos un mensaje",
  "colors": {
    "primary": "0xFFA67C72",
    "background": "0xFFF2F2F2",
    "secondaryBackground": "0xFFD9D9D9",
    "neutral": "0xFFA6A6A6",
    "accent1": "0xFFFFB347",
    "accent2": "0xFF79C7C5",
    "success": "0xFF5BBD72",
    "warning": "0xFFFF7F50",
    "error": "0xFFE57373",
    "textPrimary": "0xFF333333"
  },
  "typography": {
    "line1": {
      "fontSize": 24.0,
      "fontWeight": 7,
      "color": "0xFF333333"
    },
    "text1": {
      "fontSize": 16.0,
      "fontWeight": 4,
      "color": "0xFF333333"
    },
    "text2": {
      "fontSize": 14.0,
      "fontWeight": 4,
      "color": "0xFF333333"
    }
  }
}
```
#### 2. Lectura del Archivo JSON en la Aplicación de Flutter:
Implementa la lectura del archivo JSON como asset en tu aplicación.

```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  late final Map<String, dynamic> config;
  late final bool useJsonConfig;

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  Future<void> load(String path, {bool useJsonConfig = true}) async {
    this.useJsonConfig = useJsonConfig;
    if (useJsonConfig) {
      final jsonString = await rootBundle.loadString(path);
      config = json.decode(jsonString);
    } else {
      config = {};
    }
  }

  String getString(String key, String defaultValue) {
    return useJsonConfig
        ? (config[key] as String? ?? defaultValue)
        : defaultValue;
  }

  int getInt(String key, int defaultValue) {
    return useJsonConfig ? (config[key] as int? ?? defaultValue) : defaultValue;
  }

  double getDouble(String key, double defaultValue) {
    return useJsonConfig
        ? (config[key] as double? ?? defaultValue)
        : defaultValue;
  }

  Color getColor(String key, Color defaultValue) {
    if (useJsonConfig) {
      final colorString = config[key] as String?;
      if (colorString != null && colorString.startsWith('0x')) {
        return Color(int.parse(colorString));
      }
    }
    return defaultValue;
  }

  Duration getDuration(String key, Duration defaultValue) {
    return useJsonConfig
        ? Duration(
            milliseconds:
                config['durations'][key] ?? defaultValue.inMilliseconds)
        : defaultValue;
  }

  IconData getIcon(String key, IconData defaultValue) {
    return useJsonConfig
        ? IconData(config[key], fontFamily: 'MaterialIcons')
        : defaultValue;
  }

  Radius getRadius(String key, Radius defaultValue) {
    return useJsonConfig
        ? Radius.circular(config[key] as double? ?? defaultValue.x)
        : defaultValue;
  }

  TextStyle getTextStyle(String key, TextStyle defaultValue) {
    if (useJsonConfig) {
      final styleConfig = config[key] as Map<String, dynamic>? ?? {};
      return TextStyle(
        fontSize: styleConfig['fontSize']?.toDouble() ?? defaultValue.fontSize,
        fontWeight: FontWeight.values[
            styleConfig['fontWeight'] ?? defaultValue.fontWeight?.index ?? 0],
      );
    } else {
      return defaultValue;
    }
  }
}
```
### 3. Uso de los Datos Parametrizados:

Usa los datos json parametrizados que se inicializa en el main de la aplicación, y este reemplaza los tokens predeterminados del paquete.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp(path: 'assets/app_config.json', useJsonConfig: true);
  runApp(const MyApp());
}
```

<a name="accesibilidad"></a>
## Accesibilidad

Para mejorar la accesibilidad en la aplicación, el paquete `Mosaic Flair` utiliza la clase `Semantics` de Flutter para proporcionar información adicional sobre los widgets a los usuarios que utilizan tecnologías asistivas como TalkBack y VoiceOver. A continuación, se presentan algunas prácticas recomendadas para asegurar que los componentes sean accesibles:

- **Descripción Semántica:** Asegúrate de que todos los elementos interactivos (como botones y campos de texto) tengan descripciones semánticas apropiadas. Usa el widget `Semantics` para agregar etiquetas descriptivas y propiedades relevantes.

**Ejemplo de Uso de Semantics:**

```dart
Semantics(
  label: 'Botón de inicio',
  button: true,
  child: ElevatedButton(
    onPressed: () {},
    child: Text('Inicio'),
  ),
)
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
│   ├── strings_foundation.dart
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
    ├── strings.dart
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