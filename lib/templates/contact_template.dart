import 'package:flutter/material.dart';

import '../atoms/support.dart';
import '../atoms/text.dart';
import '../foundation/dimension_foundation.dart';

class ContactTemplate extends StatelessWidget {
  final String? contact;
  final String? email;
  const ContactTemplate({this.contact, this.email, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: 'Contáctanos',
          sizeText: SizeText.L,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddingLargeDimension),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text:
                  'Si tienes sugerencias, contáctate con nosotros.\n\nEstamos felices de ayudarte!!',
              sizeText: SizeText.M,
            ),
            SizedBox(height: size.height * 0.04),
            Support(
              label: contact ?? '+ 31 20 123 4507',
              icon: Icons.contact_support_rounded,
              info: contact ?? '+ 31 20 123 4507',
            ),
            SizedBox(height: size.height * 0.03),
            Support(
              label: email ?? 'contact@creative.com',
              icon: Icons.email,
              info: email ?? 'contact@creative.com',
            ),
          ],
        ),
      ),
    );
  }
}
