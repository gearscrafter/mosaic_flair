import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets(
      'RegisterForm displays input fields and enables register button when all fields are filled',
      (WidgetTester tester) async {
    final emailController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final lastNameController = TextEditingController();
    final phoneController = TextEditingController();
    bool registerTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RegisterForm(
            emailController: emailController,
            usernameController: usernameController,
            passwordController: passwordController,
            nameController: nameController,
            lastNameController: lastNameController,
            phoneController: phoneController,
            onRegister: () {
              registerTapped = true;
            },
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(AppInput), findsNWidgets(6));
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Nombre de usuario'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Nombres'), findsOneWidget);
    expect(find.text('Apellidos'), findsOneWidget);
    expect(find.text('Telefono'), findsOneWidget);

    await tester.enterText(
        find.widgetWithText(AppInput, 'Email'), 'test@example.com');
    await tester.enterText(
        find.widgetWithText(AppInput, 'Nombre de usuario'), 'testuser');
    await tester.enterText(
        find.widgetWithText(AppInput, 'Password'), 'password123');
    await tester.enterText(find.widgetWithText(AppInput, 'Nombres'), 'Test');
    await tester.enterText(find.widgetWithText(AppInput, 'Apellidos'), 'User');
    await tester.enterText(
        find.widgetWithText(AppInput, 'Telefono'), '1234567890');
    await tester.pumpAndSettle();

    expect(find.text('Registrarse'), findsOneWidget);

    await tester.tap(find.text('Registrarse'));
    await tester.pumpAndSettle();

    expect(registerTapped, isTrue);
  });
}
