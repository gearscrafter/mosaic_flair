import 'package:flutter/material.dart';

/// `AppNavigationBar` es un widget que representa una barra de navegación inferior personalizada.
///
/// ### Atributos:
/// - `currentIndex`: El índice actual de la página seleccionada.
/// - `onTap`: Callback que se ejecuta cuando se presiona un elemento de la barra de navegación.
/// - `items`: Una lista de elementos de la barra de navegación.

class AppNavigationBar extends StatelessWidget {
  /// El índice actual de la página seleccionada.
  final int currentIndex;

  /// Callback que se ejecuta cuando se presiona un elemento de la barra de navegación.
  final ValueChanged<int> onTap;

  /// Una lista de elementos de la barra de navegación.
  final List<BottomNavigationBarItem> items;

  /// Constructor para crear una instancia de `AppNavigationBar`.
  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      /// El índice actual de la página seleccionada.
      currentIndex: currentIndex,

      /// Callback que se ejecuta cuando se presiona un elemento de la barra de navegación.
      onTap: onTap,

      /// Lista de elementos de la barra de navegación.
      items: items,
    );
  }
}
