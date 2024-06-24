import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart'; // Asegúrate de importar tu paquete de diseño

class InputFieldShowcase extends StatelessWidget {
  const InputFieldShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campos de entrada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppInput(
              controller: TextEditingController(),
              hintText: 'Ingrese texto',
            ),
            const SizedBox(height: 16.0),
            AppInput(
              controller: TextEditingController(),
              hintText: 'Correo electrónico',
            ),
            const SizedBox(height: 16.0),
            AppInput(
              controller: TextEditingController(),
              hintText: 'Contraseña',
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
