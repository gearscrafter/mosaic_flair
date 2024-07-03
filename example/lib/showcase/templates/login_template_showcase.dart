import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class LoginTemplateShowcase extends StatelessWidget {
  const LoginTemplateShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      onLogin: (username, password) {},
    );
  }
}
