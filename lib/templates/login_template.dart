import 'package:flutter/material.dart';
import '../atoms/icon.dart';
import '../atoms/text.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';
import '../foundation/strings_foundation.dart';
import '../organisms/login_form.dart';

/// `LoginTemplate` es una plantilla de inicio de sesión que presenta un formulario de inicio de sesión
/// y una opción para registrarse si el usuario no tiene una cuenta.
///
/// ### Atributos:
/// - `onTapWithoutAccount`: Función a ejecutar cuando se presiona "¿Aún no tienes una cuenta?".
/// - `onLogin`: Función a ejecutar cuando se presiona el botón de inicio de sesión con el nombre de usuario y la contraseña.
///
/// ### Variables:
/// - `usernameController`: Controlador de texto para el campo de nombre de usuario.
/// - `passwordController`: Controlador de texto para el campo de contraseña.

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
                      padding: EdgeInsets.all(paddingLargeDimension),
                      child: Container(
                        decoration: BoxDecoration(
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
                            Padding(
                              padding:
                                  EdgeInsets.only(left: paddingLargeDimension),
                              child: AppText(
                                textColor: textColorPrimary,
                                text: mainLoginLabelString,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(paddingLargeDimension),
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
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: primaryColor,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: paddingLargeDimension),
                                          child: Text(
                                            withoutAccountLabelString,
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
                      child: Padding(
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
