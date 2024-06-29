import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('TileCard displays correct information and handles button press',
      (WidgetTester tester) async {
    bool buttonPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TileCard(
            title: 'Test Product',
            image: null,
            price: 19.99,
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );

    // Verifica que el título se muestra correctamente
    expect(find.text('Test Product'), findsOneWidget);

    // Verifica que el precio se muestra correctamente
    expect(find.text('\$ 19.99'), findsOneWidget);

    // Verifica que el botón se muestra correctamente
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);

    // Simula un toque en el botón
    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pump();

    // Verifica que el callback onPressed se llama
    expect(buttonPressed, isTrue);
  });
}
