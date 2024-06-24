import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class RegisterFormShowcase extends StatelessWidget {
  const RegisterFormShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterForm(
      usernameController: TextEditingController(),
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      nameController: TextEditingController(),
      lastNameController: TextEditingController(),
      phoneController: TextEditingController(),
    );
  }
}
