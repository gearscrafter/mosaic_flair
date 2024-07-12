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

    expect(find.text('Test Product'), findsOneWidget);

    expect(find.text('\$ 19.99'), findsOneWidget);

    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);

    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pump();

    expect(buttonPressed, isTrue);
  });
}
