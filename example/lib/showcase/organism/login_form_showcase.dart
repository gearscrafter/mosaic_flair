import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class LoginFormShowcase extends StatelessWidget {
  const LoginFormShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: AppText(
          text: 'Login Form',
          textColor: textColorPrimary,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginForm(
                  usernameController: TextEditingController(),
                  passwordController: TextEditingController(),
                  onLogin: () {}),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
