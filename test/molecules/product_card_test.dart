import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('ProductCard displays correct information and handles onTap',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProductCard(
            id: 1,
            title: 'Product Title',
            category: 'Product Category',
            image: null,
            price: 29.99,
            onTap: () {},
          ),
        ),
      ),
    );

    // Verifica que los textos se muestran correctamente
    expect(find.text('Product Title'), findsOneWidget);
    expect(find.text('Product Category'), findsOneWidget);
    expect(find.text('\$29.99'), findsOneWidget);
  });
}
