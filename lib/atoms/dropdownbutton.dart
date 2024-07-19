import 'package:flutter/material.dart';

/// `AppDropdownButton` es un widget de botón desplegable personalizado que permite seleccionar un ítem de una lista.
///
/// ### Atributos:
/// - `items`: Una lista de widgets que representan los ítems del desplegable.
/// - `hint`: Un widget que se muestra cuando no se ha seleccionado ningún ítem.
/// - `onItemSelected`: Callback que se ejecuta cuando se selecciona un ítem.

class AppDropdownButton extends StatefulWidget {
  /// Una lista de widgets que representan los ítems del desplegable.
  final List<Widget>? items;

  /// Un widget que se muestra cuando no se ha seleccionado ningún ítem.
  final Widget? hint;

  /// Callback que se ejecuta cuando se selecciona un ítem.
  final ValueChanged<Widget?>? onItemSelected;

  /// Constructor para crear una instancia de `AppDropdownButton`.
  const AppDropdownButton({
    required this.hint,
    super.key,
    this.items,
    this.onItemSelected,
  });

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  /// El ítem seleccionado actualmente.
  Widget? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: _selectedItem != null
          ? 'Seleccionado: ${_selectedItem.toString()}'
          : 'Botón desplegable',
      hint: 'Pulse dos veces para abrir el menú desplegable',
      button: true,
      child: DropdownButton<Widget>(
        /// Widget que se muestra cuando no se ha seleccionado ningún ítem.
        hint: widget.hint,

        /// El ítem seleccionado actualmente.
        value: _selectedItem,

        /// Callback que se ejecuta cuando se selecciona un nuevo ítem.
        onChanged: (Widget? newValue) {
          setState(() {
            _selectedItem = newValue;
            widget.onItemSelected?.call(_selectedItem);
          });
        },

        /// Mapea la lista de ítems a una lista de `DropdownMenuItem`.
        items: widget.items?.map<DropdownMenuItem<Widget>>((Widget? value) {
          return DropdownMenuItem<Widget>(
            value: value,
            child: value!,
          );
        }).toList(),
      ),
    );
  }
}
