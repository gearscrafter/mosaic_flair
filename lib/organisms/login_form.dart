import 'package:flutter/material.dart';

import '../atoms/button.dart';
import '../atoms/input.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback? onLogin;
  final Color? colorInput;
  final Color? labelColor;
  final Color? backgroundColor;

  const LoginForm({
    super.key,
    this.colorInput,
    this.backgroundColor,
    this.labelColor,
    required this.emailController,
    required this.passwordController,
    this.onLogin,
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
          hintText: 'Password',
          controller: passwordController,
          obscureText: true,
          colorInput: colorInput,
        ),
        const SizedBox(height: 100),
        AppButton(
          label: 'Login',
          onPressed: onLogin,
          backColor: backgroundColor,
          labelColor: labelColor,
        ),
      ],
    );
  }
}
