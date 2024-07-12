import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

/// `ButtonsShowcase` es un widget sin estado (`StatelessWidget`) que representa una pantalla
/// para mostrar diferentes ejemplos de botones en la aplicación.
///
/// Los botones son componentes de UI interactivos que permiten a los usuarios realizar acciones.
class ButtonsShowcase extends StatelessWidget {
  /// Constructor de `ButtonsShowcase`.
  const ButtonsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de aplicaciones con el título de la página.
      appBar: AppBar(
        title: const Text('Botones'),
      ),

      /// Cuerpo de la página con padding y centrado.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Ejemplo de un botón deshabilitado.
                const AppButton(
                  onPressed: null,
                  label: 'Botón Deshabilitado',
                ),
                const SizedBox(height: 24.0),

                /// Ejemplo de un botón habilitado.
                AppButton(
                  onPressed: () {},
                  label: 'Botón Habilitado',
                ),
                const SizedBox(height: 24.0),

                /// Ejemplo de un botón desplegable con múltiples opciones.
                AppDropdownButton(
                  hint: const AppText(
                    text: 'Botón de opciones multiples',
                  ),
                  items: [
                    const AppText(text: 'Item 1'),
                    const AppIcon(
                      iconData: Icons.star,
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      color: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),

                /// Ejemplo de un botón de proceso con múltiples pasos.
                ProcessButton(
                  iconData: Icons.bookmark,
                  onTextChange: (value) {},
                  steps: const [
                    "Añadir al carrito",
                    "1/2 Siguiente",
                    "2/2 Siguiente",
                  ],
                  leftOnTap: () {
                    Navigator.of(context).pop();
                  },
                  centerOnTap: () {},
                  rightOnTap: () {},
                ),
                const SizedBox(height: 24.0),

                /// Ejemplo de un botón de soporte.
                const Support(
                  icon: Icons.support,
                  info: 'soporte',
                  label: 'soporte',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
