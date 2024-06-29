import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
      'ContactTemplate displays contact and email information correctly',
      (WidgetTester tester) async {
    // Crea el widget
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactTemplate(
          contact: '+ 31 20 123 4507',
          email: 'contact@creative.com',
        ),
      ),
    );

    // Verifica que el AppBar se muestra correctamente
    expect(find.text('Contáctanos'), findsOneWidget);

    // Verifica que el texto inicial se muestra correctamente
    expect(
        find.text(
            'Si tienes sugerencias, contáctate con nosotros.\n\nEstamos felices de ayudarte!!'),
        findsOneWidget);

    // Verifica que los widgets de soporte se muestran correctamente
    expect(find.text('+ 31 20 123 4507'), findsOneWidget);
    expect(find.text('contact@creative.com'), findsOneWidget);
  });

  testWidgets(
      'ContactTemplate displays default contact and email information when none provided',
      (WidgetTester tester) async {
    // Crea el widget sin proporcionar contacto ni email
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactTemplate(),
      ),
    );

    // Verifica que los valores predeterminados se muestran correctamente
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

    // Simula un toque en el widget Support
    await tester.tap(find.byType(Support));
    await tester.pump();

    // Verifica que el SnackBar se muestra con el mensaje correcto
    expect(find.text('Copiado al portapapeles!'), findsOneWidget);
  });
}
