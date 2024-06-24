import 'package:flutter/material.dart';

import 'atoms/buttons_showcase.dart';
import 'atoms/icons_showcase.dart';
import 'atoms/input_field_showcase.dart';
import 'atoms/texts_showcase.dart';

class AtomsShowcase extends StatelessWidget {
  const AtomsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Átomos'),
      ),
      body: ListView(
        children: [
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
          ListTile(
            title: const Text('Iconos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IconsShowcase()),
              );
            },
          ),
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
