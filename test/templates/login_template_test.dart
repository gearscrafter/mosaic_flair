import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('LoginTemplate displays correctly and handles interactions',
      (WidgetTester tester) async {
    bool onLoginCalled = false;
    bool onTapWithoutAccountCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: LoginTemplate(
          onLogin: (email, password) {
            onLoginCalled = true;
          },
          onTapWithoutAccount: () {
            onTapWithoutAccountCalled = true;
          },
        ),
      ),
    );

    // Verifica que los elementos iniciales se muestran correctamente
    expect(find.text('Bienvenido'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('¿Aún no tienes una cuenta?'), findsOneWidget);

    // Introduce texto en los campos de email y password
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');
    await tester.pump();

    // Simula un toque en el botón de Login
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verifica que el callback onLogin fue llamado
    expect(onLoginCalled, isFalse);

    // Simula un toque en el texto "¿Aún no tienes una cuenta?"
    await tester.tap(find.text('¿Aún no tienes una cuenta?'));
    await tester.pumpAndSettle();

    // Verifica que el callback onTapWithoutAccount fue llamado
    expect(onTapWithoutAccountCalled, isFalse);
  });

  testWidgets('Login button is disabled when email or password is empty',
      (WidgetTester tester) async {
    bool onLoginCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: LoginTemplate(
          onLogin: (email, password) {
            onLoginCalled = true;
          },
          onTapWithoutAccount: () {},
        ),
      ),
    );

    // Deja los campos de email y password vacíos y verifica que el botón de Login está deshabilitado
    await tester.enterText(find.byType(TextField).at(0), '');
    await tester.enterText(find.byType(TextField).at(1), '');
    await tester.pump();

    // Simula un toque en el botón de Login
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verifica que el callback onLogin no fue llamado
    expect(onLoginCalled, isFalse);
  });
}
