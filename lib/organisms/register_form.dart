import 'package:flutter/material.dart';
import 'package:mosaic_flair/foundation/color_foundation.dart';

import '../atoms/button.dart';
import '../atoms/input.dart';
import '../foundation/strings_foundation.dart';

/// `RegisterForm` es un widget que representa un formulario de registro.
///
/// ### Atributos:
/// - `emailController`: Controlador del campo de texto para el email.
/// - `usernameController`: Controlador del campo de texto para el nombre de usuario.
/// - `passwordController`: Controlador del campo de texto para la contraseña.
/// - `nameController`: Controlador del campo de texto para el nombre.
/// - `lastNameController`: Controlador del campo de texto para el apellido.
/// - `phoneController`: Controlador del campo de texto para el teléfono.
/// - `onRegister`: Callback que se ejecuta cuando se presiona el botón de registro.
/// - `colorInput`: Color del texto de entrada (opcional).
/// - `labelColor`: Color del texto de la etiqueta del botón (opcional).
/// - `backgroundColor`: Color de fondo del botón (opcional).

class RegisterForm extends StatelessWidget {
  /// Controlador del campo de texto para el email.
  final TextEditingController emailController;

  /// Controlador del campo de texto para el nombre de usuario.
  final TextEditingController usernameController;

  /// Controlador del campo de texto para la contraseña.
  final TextEditingController passwordController;

  /// Controlador del campo de texto para el nombre.
  final TextEditingController nameController;

  /// Controlador del campo de texto para el apellido.
  final TextEditingController lastNameController;

  /// Controlador del campo de texto para el teléfono.
  final TextEditingController phoneController;

  /// Callback que se ejecuta cuando se presiona el botón de registro.
  final VoidCallback? onRegister;

  /// Color del texto de entrada (opcional).
  final Color? colorInput;

  /// Color del texto de la etiqueta del botón (opcional).
  final Color? labelColor;

  /// Color de fondo del botón (opcional).
  final Color? backgroundColor;

  /// Constructor para crear una instancia de `RegisterForm`.
  const RegisterForm({
    super.key,
    this.colorInput,
    this.backgroundColor,
    this.labelColor,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.lastNameController,
    required this.phoneController,
    this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInput(
          hintText: emailRegisterLabelString,
          controller: emailController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: nicknameRegisterLabelString,
          controller: usernameController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: passwordRegisterLabelString,
          controller: passwordController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: userRegisterLabelString,
          controller: nameController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: lastnameRegisterLabelString,
          controller: lastNameController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: cellphoneRegisterLabelString,
          controller: phoneController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 100),
        AppButton(
          label: buttonRegisterLabelString,
          onPressed: onRegister,
          backColor: accentColor1,
          labelColor: labelColor,
          hasIconAnimation: (phoneController.text.isEmpty ||
                  emailController.text.isEmpty ||
                  nameController.text.isEmpty ||
                  passwordController.text.isEmpty ||
                  usernameController.text.isEmpty ||
                  lastNameController.text.isEmpty)
              ? false
              : true,
        ),
      ],
    );
  }
}
