import 'package:flutter/material.dart';
import 'atoms/buttons_showcase.dart';
import 'atoms/icons_showcase.dart';
import 'atoms/input_field_showcase.dart';
import 'atoms/texts_showcase.dart';

/// `AtomsShowcase` es un widget sin estado (`StatelessWidget`) que representa una pantalla
/// para mostrar diferentes ejemplos de átomos en la aplicación.
///
/// Los átomos son los componentes más pequeños y reutilizables de la UI.
class AtomsShowcase extends StatelessWidget {
  /// Constructor de `AtomsShowcase`.
  const AtomsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de aplicaciones con el título de la página.
      appBar: AppBar(
        title: const Text('Átomos'),
      ),

      /// Cuerpo de la página que contiene una lista de elementos.
      body: ListView(
        children: [
          /// Elemento de la lista que navega a la pantalla `ButtonsShowcase`.
          ListTile(
            title: const Text('Botones'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ButtonsShowcase()),
              );
            },
          ),

          /// Elemento de la lista que navega a la pantalla `IconsShowcase`.
          ListTile(
            title: const Text('Iconos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IconsShowcase()),
              );
            },
          ),

          /// Elemento de la lista que navega a la pantalla `InputFieldShowcase`.
          ListTile(
            title: const Text('Campos de entrada'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InputFieldShowcase()),
              );
            },
          ),

          /// Elemento de la lista que navega a la pantalla `TextsShowcase`.
          ListTile(
            title: const Text('Tipos de texto'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TextsShowcase()),
              );
            },
          ),
        ],
      ),
    );
  }
}
