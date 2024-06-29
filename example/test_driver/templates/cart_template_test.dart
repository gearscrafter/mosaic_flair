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
      CartItem(name: 'Product 1', image: null, price: 29.99, quantity: 1),
      CartItem(name: 'Product 2', image: null, price: 49.99, quantity: 2),
    ];

    bool checkoutCalled = false;

    // Crea el widget
    await tester.pumpWidget(
      MaterialApp(
        home: CartTemplate(
          cartItems: cartItems,
          onCheckout: () {
            checkoutCalled = true;
          },
        ),
      ),
    );

    // Verifica que los elementos del carrito se muestran correctamente
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 2'), findsOneWidget);
    expect(find.text('Quantity: 1'), findsOneWidget);
    expect(find.text('Quantity: 2'), findsOneWidget);
    expect(find.text('\$29.99'), findsOneWidget);
    expect(find.text('\$99.98'), findsOneWidget);

    // Simula un toque en el botón de pagar
    await tester.tap(find.text('Pagar'));
    await tester.pumpAndSettle();

    // Verifica que el callback de pago fue llamado
    expect(checkoutCalled, isTrue);
  });
}
