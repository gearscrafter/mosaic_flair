import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('ProductList displays products and triggers events correctly',
      (WidgetTester tester) async {
    final products = [
      const ProductCard(
          id: 1,
          title: 'Product 1',
          category: 'Category 1',
          image: null,
          price: 29.99),
      const ProductCard(
          id: 2,
          title: 'Product 2',
          category: 'Category 2',
          image: null,
          price: 49.99),
    ];

    int selectedProductId = -1;
    bool isProductSelectedTapped = false;
    bool isScrolling = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProductList(
            products: products,
            productSelected: (id) {
              selectedProductId = id;
            },
            onTapProductSelected: () {
              isProductSelectedTapped = true;
            },
            onScrollChange: (scrolling) {
              isScrolling = scrolling;
            },
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 2'), findsOneWidget);

    await tester.tap(find.text('Product 1'));
    await tester.pumpAndSettle();

    expect(selectedProductId, 1);
    expect(isProductSelectedTapped, isTrue);

    await tester.drag(find.byType(GridView), const Offset(0, -300));
    await tester.pumpAndSettle();

    expect(isScrolling, isFalse);
  });
}
