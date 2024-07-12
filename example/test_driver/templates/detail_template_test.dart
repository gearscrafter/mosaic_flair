import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mosaic_flair/data/product_dart.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
      'DetailsTemplate displays product details and handles quantity changes',
      (WidgetTester tester) async {
    final product = Product(
      name: 'Test Product',
      description: 'This is a test product.',
      price: 99.99,
      image: null,
    );

    int quantity = 1;

    await tester.pumpWidget(
      MaterialApp(
        home: DetailsTemplate(
          product: product,
          onAddToCart: (Product? p, int q) {
            quantity = q;
          },
        ),
      ),
    );

    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('This is a test product.'), findsOneWidget);

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    await tester.drag(
        find.byType(SingleChildScrollView), const Offset(0, -300));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Añadir al carrito'));
    await tester.pumpAndSettle();

    expect(quantity, 1);
  });
}
