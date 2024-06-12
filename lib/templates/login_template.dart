import 'package:flutter/material.dart';
import '../organisms/login_form.dart';

class LoginTemplate extends StatelessWidget {
  final void Function(String email, String password)? onLogin;

  const LoginTemplate({
    super.key,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LoginForm(
          emailController: emailController,
          passwordController: passwordController,
          onLogin: () {
            if (onLogin != null) {
              onLogin!(emailController.text, passwordController.text);
            }
          },
        ),
      ),
    );
  }
}
