import 'package:flutter/material.dart';
import '../atoms/text.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';
import '../organisms/register_form.dart';

class RegisterTemplate extends StatelessWidget {
  final void Function(String email, String password, String username,
      String lastname, String name, String phone)? onRegister;

  RegisterTemplate({
    super.key,
    this.onRegister,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: const BackButton(
          color: backgroundColor,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(paddingLargeDimension),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(borderRadiusDimensions))),
                    padding: const EdgeInsets.all(paddingLargeDimension),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RegisterForm(
                            emailController: emailController,
                            passwordController: passwordController,
                            usernameController: usernameController,
                            lastNameController: lastNameController,
                            nameController: nameController,
                            phoneController: phoneController,
                            colorInput: textColorPrimary,
                            labelColor: textColorPrimary,
                            onRegister: emailController.text.isEmpty ||
                                    passwordController.text.isEmpty ||
                                    usernameController.text.isEmpty ||
                                    lastNameController.text.isEmpty ||
                                    nameController.text.isEmpty ||
                                    phoneController.text.isEmpty
                                ? null
                                : () {
                                    if (onRegister != null) {
                                      onRegister!(
                                          emailController.text,
                                          passwordController.text,
                                          usernameController.text,
                                          lastNameController.text,
                                          nameController.text,
                                          phoneController.text);
                                    }
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            left: 20,
            top: 20,
            child: Padding(
              padding: EdgeInsets.only(left: paddingSmallDimension),
              child: AppText(
                text: 'Registrate',
                style: TextStyle(
                    color: backgroundColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
