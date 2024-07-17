import 'package:flutter/material.dart';

import '../atoms/button.dart';
import '../atoms/input.dart';
import '../foundation/strings_foundation.dart';

/// `LoginForm` es un widget que representa un formulario de inicio de sesión.
///
/// ### Atributos:
/// - `usernameController`: Controlador del campo de texto para el nombre de usuario.
/// - `passwordController`: Controlador del campo de texto para la contraseña.
/// - `onLogin`: Callback que se ejecuta cuando se presiona el botón de inicio de sesión.
/// - `colorInput`: Color del texto de entrada (opcional).
/// - `labelColor`: Color del texto de la etiqueta del botón (opcional).
/// - `backgroundColor`: Color de fondo del botón (opcional).

class LoginForm extends StatelessWidget {
  /// Controlador del campo de texto para el nombre de usuario.
  final TextEditingController usernameController;

  /// Controlador del campo de texto para la contraseña.
  final TextEditingController passwordController;

  /// Callback que se ejecuta cuando se presiona el botón de inicio de sesión.
  final VoidCallback? onLogin;

  /// Color del texto de entrada (opcional).
  final Color? colorInput;

  /// Color del texto de la etiqueta del botón (opcional).
  final Color? labelColor;

  /// Color de fondo del botón (opcional).
  final Color? backgroundColor;

  /// Constructor para crear una instancia de `LoginForm`.
  const LoginForm({
    super.key,
    this.colorInput,
    this.backgroundColor,
    this.labelColor,
    required this.usernameController,
    required this.passwordController,
    this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInput(
          hintText: userLoginLabelString,
          controller: usernameController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: passwordLoginLabelString,
          controller: passwordController,
          obscureText: true,
          colorInput: colorInput,
        ),
        const SizedBox(height: 100),
        AppButton(
          label: buttonLoginLabelString,
          onPressed: onLogin,
          backColor: backgroundColor,
          labelColor: labelColor,
        ),
      ],
    );
  }
}
