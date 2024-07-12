import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('RegisterTemplate displays correctly and handles interactions',
      (WidgetTester tester) async {
    bool onRegisterCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: RegisterTemplate(
          onRegister: (email, password, username, lastname, name, phone) {
            onRegisterCalled = true;
          },
        ),
      ),
    );

    expect(find.text('Registrate'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Nombre de usuario'), findsOneWidget);
    expect(find.text('Nombres'), findsOneWidget);
    expect(find.text('Apellidos'), findsOneWidget);
    expect(find.text('Telefono'), findsOneWidget);
    expect(find.text('Registrarse'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');
    await tester.enterText(find.byType(TextField).at(2), 'testuser');
    await tester.enterText(find.byType(TextField).at(3), 'Test');
    await tester.enterText(find.byType(TextField).at(4), 'User');
    await tester.enterText(find.byType(TextField).at(5), '1234567890');
    await tester.pump();

    await tester.tap(find.text('Registrarse'));
    await tester.pumpAndSettle();

    expect(onRegisterCalled, isFalse);
  });

  testWidgets('Register button is disabled when any field is empty',
      (WidgetTester tester) async {
    bool onRegisterCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: RegisterTemplate(
          onRegister: (email, password, username, lastname, name, phone) {
            onRegisterCalled = true;
          },
        ),
      ),
    );

    await tester.enterText(find.byType(TextField).at(0), '');
    await tester.enterText(find.byType(TextField).at(1), 'password123');
    await tester.enterText(find.byType(TextField).at(2), 'testuser');
    await tester.enterText(find.byType(TextField).at(3), 'Test');
    await tester.enterText(find.byType(TextField).at(4), 'User');
    await tester.enterText(find.byType(TextField).at(5), '1234567890');
    await tester.pump();

    await tester.tap(find.text('Registrarse'));
    await tester.pumpAndSettle();

    expect(onRegisterCalled, isFalse);
  });
}
