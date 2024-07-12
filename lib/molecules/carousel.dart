import 'package:flutter/material.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

/// `AppCarousel` es un widget que representa un carrusel de elementos deslizables.
///
/// ### Atributos:
/// - `items`: Una lista de widgets que se mostrarán en el carrusel.
/// - `height`: La altura del carrusel (por defecto es 200.0).

class AppCarousel extends StatefulWidget {
  /// Una lista de widgets que se mostrarán en el carrusel.
  final List<Widget> items;

  /// La altura del carrusel.
  final double height;

  /// Constructor para crear una instancia de `AppCarousel`.
  const AppCarousel({
    super.key,
    required this.items,
    this.height = 200.0,
  });

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  /// Índice del elemento actualmente visible en el carrusel.
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Contenedor que define la altura del carrusel y muestra los elementos deslizables.
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(paddingMediumDimension),
                child: widget.items[index],
              );
            },
          ),
        ),

        /// Indicadores de página para mostrar el elemento actualmente visible.
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.items.length,
            (index) => _buildDot(index),
          ),
        ),
      ],
    );
  }

  /// Construye un punto indicador para la página actual del carrusel.
  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? primaryColor : secondaryBackgroundColor,
      ),
    );
  }
}
