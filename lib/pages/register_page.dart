import 'package:flutter/material.dart';

import '../templates/register_template.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterTemplate(
      onRegister: (email, password, username, lastname, name, phone) {},
    );
  }
}
