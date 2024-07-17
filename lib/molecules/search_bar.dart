import 'package:flutter/material.dart';

import '../foundation/dimension_foundation.dart';
import '../foundation/color_foundation.dart';
import '../foundation/icon_foundation.dart';

/// `SearchBarM` es un widget que representa una barra de búsqueda personalizada.
///
/// ### Atributos:
/// - `controller`: El controlador del campo de texto.
/// - `onSearch`: Callback que se ejecuta cuando se cambia el texto.
/// - `hintText`: El texto de sugerencia que se muestra cuando el campo está vacío (por defecto es 'Search...').

class SearchBarM extends StatelessWidget {
  /// El controlador del campo de texto.
  final TextEditingController controller;

  /// Callback que se ejecuta cuando se cambia el texto.
  final ValueChanged<String>? onSearch;

  /// El texto de sugerencia que se muestra cuando el campo está vacío.
  final String hintText;

  /// Constructor para crear una instancia de `SearchBarM`.
  const SearchBarM({
    super.key,
    required this.controller,
    this.onSearch,
    this.hintText = 'Search...',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onSearch,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          searchIcon,
          size: 35,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusDimensions),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: backgroundColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: paddingMediumDimension,
          vertical: paddingMediumDimension,
        ),
      ),
    );
  }
}
