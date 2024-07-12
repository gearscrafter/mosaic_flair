import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mosaic_flair/data/cart_data.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('CartTemplate displays cart items and triggers checkout',
      (WidgetTester tester) async {
    // Crea una lista de elementos del carrito
    final cartItems = [
      CartItem(
          id: 1, name: 'Product 1', image: null, price: 29.99, quantity: 1),
      CartItem(
          id: 2, name: 'Product 2', image: null, price: 49.99, quantity: 2),
    ];

    bool checkoutCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: CartTemplate(
          cartItems: cartItems,
        ),
      ),
    );

    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 2'), findsOneWidget);
    expect(find.text('Quantity: 1'), findsOneWidget);
    expect(find.text('Quantity: 2'), findsOneWidget);
    expect(find.text('\$29.99'), findsOneWidget);
    expect(find.text('\$99.98'), findsOneWidget);

    await tester.tap(find.text('Pagar'));
    await tester.pumpAndSettle();

    expect(checkoutCalled, isTrue);
  });
}
