import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class SearchBarShowcase extends StatelessWidget {
  const SearchBarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(paddingMediumDimension),
            child: SearchBarM(
              controller: TextEditingController(text: 'buscando...'),
              hintText: 'buscador',
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
