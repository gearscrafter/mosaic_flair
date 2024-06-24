import 'package:flutter/material.dart';
import 'package:mosaic_flair/foundation/color_foundation.dart';

import '../atoms/button.dart';
import '../atoms/input.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final VoidCallback? onRegister;
  final Color? colorInput;
  final Color? labelColor;
  final Color? backgroundColor;

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
          hintText: 'Email',
          controller: emailController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: 'Nombre de usuario',
          controller: usernameController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: 'Password',
          controller: passwordController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: 'Nombres',
          controller: nameController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: 'Apellidos',
          controller: lastNameController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: 'Telefono',
          controller: phoneController,
          colorInput: colorInput,
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 100),
        AppButton(
          label: 'Registrarse',
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
