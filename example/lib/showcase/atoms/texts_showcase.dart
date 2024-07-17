import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart'; // Asegúrate de importar tu paquete de diseño

class TextsShowcase extends StatelessWidget {
  const TextsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos de texto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Texto de ejemplo - Estilo predeterminado',
              textColor: textColorPrimary,
            ),
            const SizedBox(height: 16.0),
            AppText(
              text: 'Texto grande',
              textColor: textColorPrimary,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            AppText(
              text: 'Texto mediano',
              textColor: textColorPrimary,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            AppText(
              text: 'Texto pequeño',
              textColor: textColorPrimary,
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 16.0),
            AppText(
              text: 'Texto en cursiva',
              textColor: textColorPrimary,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 16,
            ),
            AppText(
              isRichText: true,
              textColor: textColorPrimary,
              textSpans: const [
                TextSpan(
                  text: 'Esta es una ',
                  style: TextStyle(fontSize: 16.0),
                ),
                TextSpan(
                  text: 'descripción ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: 'dinámica que ',
                  style: TextStyle(fontSize: 16.0),
                ),
                TextSpan(
                  text: 'muestra diferentes ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: 'estilos en un mismo texto.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
