import 'package:flutter/material.dart';

import '../atoms/support.dart';
import '../atoms/text.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';
import '../foundation/strings_foundation.dart';

/// `ContactTemplate` es un widget que representa la plantilla de contacto.
///
/// ### Atributos:
/// - `contact`: Número de contacto opcional a mostrar.
/// - `email`: Dirección de correo electrónico opcional a mostrar.

class ContactTemplate extends StatelessWidget {
  /// Número de contacto opcional a mostrar.
  final String? contact;

  /// Dirección de correo electrónico opcional a mostrar.
  final String? email;

  /// Constructor para crear una instancia de `ContactTemplate`.
  const ContactTemplate({this.contact, this.email, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: contact ?? mainContactLabelString,
          textColor: textColorPrimary,
          sizeText: SizeText.L,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(paddingLargeDimension),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: descriptionContactLabelString,
              textColor: textColorPrimary,
              sizeText: SizeText.M,
            ),
            SizedBox(height: size.height * 0.04),
            Support(
              label: contact ?? phoneContactLabelString,
              icon: Icons.contact_support_rounded,
              info: contact ?? phoneContactLabelString,
            ),
            SizedBox(height: size.height * 0.03),
            Support(
              label: email ?? emailContactLabelString,
              icon: Icons.email,
              info: email ?? emailContactLabelString,
            ),
          ],
        ),
      ),
    );
  }
}
