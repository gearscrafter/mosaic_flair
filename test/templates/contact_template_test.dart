import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets(
      'ContactTemplate displays contact and email information correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactTemplate(
          contact: '+ 31 20 123 4507',
          email: 'contact@creative.com',
        ),
      ),
    );

    expect(find.text('Contáctanos'), findsOneWidget);

    expect(
        find.text(
            'Si tienes sugerencias, contáctate con nosotros.\n\nEstamos felices de ayudarte!!'),
        findsOneWidget);

    expect(find.text('+ 31 20 123 4507'), findsOneWidget);
    expect(find.text('contact@creative.com'), findsOneWidget);
  });

  testWidgets(
      'ContactTemplate displays default contact and email information when none provided',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactTemplate(),
      ),
    );

    expect(find.text('+ 31 20 123 4507'), findsOneWidget);
    expect(find.text('contact@creative.com'), findsOneWidget);
  });

  testWidgets('Support widget copies label to clipboard and shows Snackbar',
      (WidgetTester tester) async {
    // Crea el widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Support(
            label: 'contact@creative.com',
            icon: Icons.email,
            info: 'Copiado al portapapeles!',
          ),
        ),
      ),
    );

    await tester.tap(find.byType(Support));
    await tester.pump();

    expect(find.text('Copiado al portapapeles!'), findsOneWidget);
  });
}
