import 'package:flutter/material.dart';

/// `AppIcon` es un widget que representa un icono dentro de un contenedor circular con opciones de personalización.
///
/// ### Atributos:
/// - `iconData`: El icono que se mostrará.
/// - `color`: El color del icono.
/// - `backgroundColor`: El color de fondo del contenedor.
/// - `size`: El tamaño del icono.
/// - `hasShadow`: Indica si el contenedor tiene sombra.
/// - `sizeContainer`: El tamaño del contenedor.

class AppIcon extends StatelessWidget {
  /// El icono que se mostrará.
  final IconData iconData;

  /// El color del icono.
  final Color color;

  /// El color de fondo del contenedor.
  final Color backgroundColor;

  /// El tamaño del icono.
  final double size;

  /// Indica si el contenedor tiene sombra.
  final bool hasShadow;

  /// El tamaño del contenedor.
  final double sizeContainer;

  /// Constructor para crear una instancia de `AppIcon`.
  const AppIcon({
    super.key,
    required this.iconData,
    this.hasShadow = false,
    this.sizeContainer = 40.0,
    this.backgroundColor = Colors.white,
    this.color = Colors.black,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      /// Altura del contenedor.
      height: sizeContainer,

      /// Anchura del contenedor.
      width: sizeContainer,

      /// Decoración del contenedor.
      decoration: BoxDecoration(
        /// Sombras del contenedor.
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,

        /// Color de fondo del contenedor.
        color: backgroundColor,

        /// Forma del contenedor.
        shape: BoxShape.circle,
      ),

      /// Icono dentro del contenedor.
      child: Icon(
        iconData,
        color: color,
        size: size,
      ),
    );
  }
}
