import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('LoginForm displays and works correctly',
      (WidgetTester tester) async {
    // Initialize the controllers for the text fields
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    // A variable to track if the login button is pressed
    bool isLoginPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginForm(
            usernameController: usernameController,
            passwordController: passwordController,
            onLogin: () {
              isLoginPressed = true;
            },
          ),
        ),
      ),
    );

    // Ensure the input fields and button are displayed
    expect(find.byType(AppInput), findsNWidgets(2));
    expect(find.byType(AppButton), findsOneWidget);

    // Verify that the hint texts are correct
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Enter text into the username and password fields
    await tester.enterText(find.byType(AppInput).at(0), 'test@example.com');
    await tester.enterText(find.byType(AppInput).at(1), 'password');

    // Verify the entered text
    expect(usernameController.text, 'test');
    expect(passwordController.text, 'password');

    // Tap the login button
    await tester.tap(find.byType(AppButton));
    await tester.pumpAndSettle();

    // Verify that the login button was pressed
    expect(isLoginPressed, isTrue);
  });
}
