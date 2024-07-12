import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('LoginTemplate displays correctly and handles interactions',
      (WidgetTester tester) async {
    bool onLoginCalled = false;
    bool onTapWithoutAccountCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: LoginTemplate(
          onLogin: (username, password) {
            onLoginCalled = true;
          },
          onTapWithoutAccount: () {
            onTapWithoutAccountCalled = true;
          },
        ),
      ),
    );

    expect(find.text('Bienvenido'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('¿Aún no tienes una cuenta?'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');
    await tester.pump();

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(onLoginCalled, isFalse);

    await tester.tap(find.text('¿Aún no tienes una cuenta?'));
    await tester.pumpAndSettle();

    expect(onTapWithoutAccountCalled, isFalse);
  });

  testWidgets('Login button is disabled when username or password is empty',
      (WidgetTester tester) async {
    bool onLoginCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: LoginTemplate(
          onLogin: (username, password) {
            onLoginCalled = true;
          },
          onTapWithoutAccount: () {},
        ),
      ),
    );

    await tester.enterText(find.byType(TextField).at(0), '');
    await tester.enterText(find.byType(TextField).at(1), '');
    await tester.pump();

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(onLoginCalled, isFalse);
  });
}
