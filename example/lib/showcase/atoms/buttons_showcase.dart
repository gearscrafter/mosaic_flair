import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class ButtonsShowcase extends StatelessWidget {
  const ButtonsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppButton(
                  onPressed: null,
                  label: 'Botón Deshabilitado',
                ),
                const SizedBox(height: 24.0),
                AppButton(
                  onPressed: () {},
                  label: 'Botón Habilitado',
                ),
                const SizedBox(height: 24.0),
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
