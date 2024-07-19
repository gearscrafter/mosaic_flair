import 'package:flutter/material.dart';

/// `AppInput` es un widget de campo de texto personalizado con opciones de personalización.
///
/// ### Atributos:
/// - `controller`: Controlador para manejar el texto ingresado en el campo.
/// - `hintText`: Texto que se muestra como sugerencia cuando el campo está vacío.
/// - `obscureText`: Indica si el texto ingresado debe ser oculto (por ejemplo, para contraseñas).
/// - `colorInput`: El color del texto y del borde del campo.

class AppInput extends StatefulWidget {
  /// Controlador para manejar el texto ingresado en el campo.
  final TextEditingController controller;

  /// Texto que se muestra como sugerencia cuando el campo está vacío.
  final String hintText;

  /// Indica si el texto ingresado debe ser oculto (por ejemplo, para contraseñas).
  final bool obscureText;

  /// El color del texto y del borde del campo.
  final Color? colorInput;

  /// Constructor para crear una instancia de `AppInput`.
  const AppInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.colorInput = Colors.black,
    this.obscureText = false,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      onTapHint: widget.obscureText ? 'Campo del password' : 'Campo de texto',
      child: TextField(
        /// Controlador para manejar el texto ingresado en el campo.
        controller: widget.controller,

        /// Indica si el texto ingresado debe ser oculto.
        obscureText: _isObscured,

        /// Decoración del campo de texto.
        decoration: InputDecoration(
          /// Color de fondo del campo.
          fillColor: widget.colorInput,

          /// Texto que se muestra como sugerencia cuando el campo está vacío.
          hintText: widget.hintText,

          /// Color del icono.
          iconColor: widget.colorInput,

          /// Icono que se muestra a la derecha del campo cuando `obscureText` es verdadero.
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                  ),
                  color: widget.colorInput,
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,

          /// Borde del campo cuando no está enfocado.
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.colorInput ?? Colors.white),
          ),

          /// Borde del campo cuando está enfocado.
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.colorInput ?? Colors.white),
          ),

          /// Borde del campo en general.
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.colorInput ?? Colors.white),
          ),

          /// Estilo del texto de sugerencia.
          hintStyle: TextStyle(color: widget.colorInput),
        ),

        /// Color del cursor.
        cursorColor: widget.colorInput,

        /// Estilo del texto ingresado.
        style: TextStyle(color: widget.colorInput),
      ),
    );
  }
}
