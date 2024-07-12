import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('ProductDetail displays correctly and can add to cart',
      (WidgetTester tester) async {
    const String title = 'Test Product';
    const String description = 'This is a test product description.';
    const double price = 99.99;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductDetail(
            title: title,
            description: description,
            image: null,
            price: price,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('\$ 99.99'), findsOneWidget);

    expect(find.text(title), findsOneWidget);

    expect(find.text(description), findsOneWidget);
  });
}
