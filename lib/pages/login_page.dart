import 'package:flutter/material.dart';

import '../templates/login_template.dart';

class LoginPage extends StatelessWidget {
  final void Function(String email, String password)? onLogin;
  const LoginPage({this.onLogin, super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      onLogin: onLogin,
    );
  }
}
