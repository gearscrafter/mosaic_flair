import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('LoginForm displays and works correctly',
      (WidgetTester tester) async {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

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

    expect(find.byType(AppInput), findsNWidgets(2));
    expect(find.byType(AppButton), findsOneWidget);

    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    await tester.enterText(find.byType(AppInput).at(0), 'test@example.com');
    await tester.enterText(find.byType(AppInput).at(1), 'password');

    expect(usernameController.text, 'test');
    expect(passwordController.text, 'password');

    await tester.tap(find.byType(AppButton));
    await tester.pumpAndSettle();

    expect(isLoginPressed, isTrue);
  });
}
