import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class ProcessButtonShowcase extends StatelessWidget {
  const ProcessButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProcessButton(
        leftOnTap: () {
          Navigator.pop(context);
        },
        centerOnTap: () {},
        steps: const ['Agregar al carrito', 'Paso 1', 'Paso 2'],
      ),
    );
  }
}
