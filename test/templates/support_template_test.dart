import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('SupportTemplate displays content correctly',
      (WidgetTester tester) async {
    const email = 'test@example.com';
    const phone = '+1 234 567 890';
    const message = 'Envíanos un mensaje';
    final schedulesList = [
      'Lunes - Viernes: 9 AM - 6 PM',
      'Sábado: 10 AM - 2 PM'
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: SupportTemplate(
          email: email,
          phone: phone,
          message: message,
          schedulesList: schedulesList,
        ),
      ),
    );

    expect(find.text('Ayuda y Soporte'), findsOneWidget);

    expect(find.text('Bienvenido a nuestro espacio de Ayuda y Soporte.'),
        findsOneWidget);
    expect(find.text('Nuestros horarios de servicio:'), findsOneWidget);
    expect(find.text('No encontraste la respuesta a tu pregunta?'),
        findsOneWidget);

    for (var schedule in schedulesList) {
      expect(find.text(' - $schedule'), findsOneWidget);
    }
  });
}
