import 'package:flutter/material.dart';
import 'molecules/carousel_showcase.dart';
import 'molecules/menu_showcase.dart';
import 'molecules/product_card_showcase.dart';
import 'molecules/search_bar_showcase.dart';
import 'molecules/tile_card_showcase.dart';

/// `MoleculeShowcase` es un widget sin estado (`StatelessWidget`) que representa una pantalla
/// para mostrar diferentes ejemplos de moléculas en la aplicación.
///
/// Las moléculas son componentes de UI que combinan múltiples átomos para formar una funcionalidad más compleja.
class MoleculeShowcase extends StatelessWidget {
  /// Constructor de `MoleculeShowcase`.
  const MoleculeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de aplicaciones con el título de la página.
      appBar: AppBar(
        title: const Text('Moleculas'),
      ),

      /// Cuerpo de la página que contiene una lista de elementos con padding y scroll.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Elemento de la lista que navega a la pantalla `MenuShowcase`.
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

              /// Elemento de la lista que navega a la pantalla `SearchBarShowcase`.
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

              /// Elemento de la lista que navega a la pantalla `ProductCardShowcase`.
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

              /// Elemento de la lista que navega a la pantalla `CarouselShowcase`.
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

              /// Elemento de la lista que navega a la pantalla `TileCardShowcase`.
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
