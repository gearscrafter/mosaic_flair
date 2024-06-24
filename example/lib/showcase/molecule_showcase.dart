import 'package:flutter/material.dart';

import 'molecules/carousel_showcase.dart';
import 'molecules/menu_showcase.dart';
import 'molecules/product_card_showcase.dart';
import 'molecules/search_bar_showcase.dart';
import 'molecules/tile_card_showcase.dart';

class MoleculeShowcase extends StatelessWidget {
  const MoleculeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moleculas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Menu'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MenuShowcase()),
                  );
                },
              ),
              ListTile(
                title: const Text('Barra buscadora'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchBarShowcase()),
                  );
                },
              ),
              ListTile(
                title: const Text('Tarjeta de producto'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductCardShowcase()),
                  );
                },
              ),
              ListTile(
                title: const Text('Carousel'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CarouselShowcase()),
                  );
                },
              ),
              ListTile(
                title: const Text('Tarjeta'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TileCardShowcase()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
