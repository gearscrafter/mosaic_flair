import 'package:flutter/material.dart';
import '../atoms/support.dart';
import '../atoms/text.dart';
import '../data/support_data.dart';
import '../foundation/dimension_foundation.dart';

/// `SupportTemplate` es una plantilla que proporciona información y soporte al usuario.
///
/// ### Atributos:
/// - `schedulesList`: Lista de horarios de servicio.
/// - `email`: Correo electrónico para contacto.
/// - `phone`: Número de teléfono para contacto.
/// - `message`: Mensaje adicional para el usuario.
///
/// ### Variables:
/// - `size`: Tamaño de la pantalla para manejar la disposición de los elementos.

class SupportTemplate extends StatelessWidget {
  final List<String>? schedulesList;
  final String? email;
  final String? phone;
  final String? message;
  const SupportTemplate(
      {this.email, this.phone, this.message, this.schedulesList, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: 'Ayuda y Soporte',
          sizeText: SizeText.L,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddingLargeDimension),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: 'Bienvenido a nuestro espacio de Ayuda y Soporte.',
                sizeText: SizeText.M,
              ),
              SizedBox(height: size.height * 0.05),
              const AppText(
                text: 'Nuestros horarios de servicio:',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: size.height * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (schedulesList ?? workSchedules)
                    .map((item) => AppText(
                          text: ' - $item',
                        ))
                    .toList(),
              ),
              SizedBox(height: size.height * 0.05),
              const AppText(
                text: '¿No encontraste la respuesta a tu pregunta?',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: size.height * 0.03),
              Support(
                label: email ?? 'Envíanos un correo',
                icon: Icons.email,
                info: 'Correo electrónico copiado al portapapeles.',
              ),
              SizedBox(height: size.height * 0.03),
              Support(
                label: phone ?? 'Llámanos',
                icon: Icons.phone,
                info: '+1 123 456 7890',
              ),
              SizedBox(height: size.height * 0.03),
              Support(
                label: message ?? 'Envíanos un mensaje',
                icon: Icons.message_rounded,
                info: 'Escribiendo...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
