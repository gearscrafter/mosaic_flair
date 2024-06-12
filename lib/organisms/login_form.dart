import 'package:flutter/material.dart';

import '../atoms/button.dart';
import '../atoms/input.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback? onLogin;

  const LoginForm({
    super.key,
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
        ),
        const SizedBox(height: 16),
        AppInput(
          hintText: 'Password',
          controller: passwordController,
          obscureText: true,
        ),
        const SizedBox(height: 16),
        AppButton(
          label: 'Login',
          onPressed: onLogin,
        ),
      ],
    );
  }
}
