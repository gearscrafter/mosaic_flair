import 'package:flutter/material.dart';
import '../atoms/icon.dart';
import '../atoms/text.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';
import '../organisms/login_form.dart';

class LoginTemplate extends StatelessWidget {
  final VoidCallback? onTapWithoutAccount;
  final void Function(String username, String password)? onLogin;

  LoginTemplate({
    super.key,
    this.onTapWithoutAccount,
    required this.onLogin,
  });

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(paddingLargeDimension),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(borderRadiusDimensions))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: paddingLargeDimension),
                              child: AppText(
                                text: 'Bienvenido',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.all(paddingLargeDimension),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    LoginForm(
                                      usernameController: usernameController,
                                      passwordController: passwordController,
                                      colorInput: textColorPrimary,
                                      backgroundColor: accentColor1,
                                      onLogin: usernameController
                                                  .text.isEmpty ||
                                              passwordController.text.isEmpty
                                          ? null
                                          : () {
                                              if (onLogin != null) {
                                                onLogin!(
                                                  usernameController.text,
                                                  passwordController.text,
                                                );
                                              }
                                            },
                                    ),
                                    SizedBox(
                                      height: size.height * 0.1,
                                    ),
                                    GestureDetector(
                                      onTap: onTapWithoutAccount,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: primaryColor,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: paddingLargeDimension),
                                          child: Text(
                                            '¿Aún no tienes una cuenta?',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: primaryColor,
                                              fontSize: fontSizeMediumDimension,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (!isLandscape)
                  ? Positioned(
                      top: size.height * 0.15,
                      left: 0,
                      right: 0,
                      child: const Padding(
                        padding: EdgeInsets.only(left: paddingLargeDimension),
                        child: AppIcon(
                          iconData: Icons.all_inclusive_rounded,
                          color: primaryColor,
                          backgroundColor: backgroundColor,
                          hasShadow: true,
                          size: 60,
                          sizeContainer: 100,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
