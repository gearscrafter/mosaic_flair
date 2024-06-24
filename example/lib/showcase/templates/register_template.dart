import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class RegisterTemplateShowcase extends StatelessWidget {
  const RegisterTemplateShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterTemplate(
      onRegister: (email, password, username, lastname, name, phone) {},
    );
  }
}
