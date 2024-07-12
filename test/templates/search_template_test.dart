import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/data/product_dart.dart';
import 'package:mosaic_flair/mosaic_flair.dart';
import 'package:mockito/mockito.dart';

class MockProduct extends Mock implements Product {}

void main() {
  testWidgets('SearchTemplate displays products and handles search',
      (WidgetTester tester) async {
    final productCards = [
      const ProductCard(
        id: 1,
        title: 'Product 1',
        category: 'Category 1',
        image: null,
        price: 29.99,
      ),
      const ProductCard(
        id: 2,
        title: 'Product 2',
        category: 'Category 2',
        image: null,
        price: 49.99,
      ),
      const ProductCard(
        id: 3,
        title: 'Another Product',
        category: 'Category 3',
        image: null,
        price: 99.99,
      ),
    ];

    bool getProductCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: SearchTemplate(
          productCards: productCards,
          getProduct: (product) {
            getProductCalled = true;
          },
        ),
      ),
    );

    expect(find.text('Product 1'), findsAny);
    expect(find.text('Product 2'), findsOneWidget);
    expect(find.text('Another Product'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Product 1');
    await tester.pump();

    expect(find.text('Product 1'), findsAny);
    expect(find.text('Product 2'), findsNothing);
    expect(find.text('Another Product'), findsNothing);

    await tester.enterText(find.byType(TextField), 'Non-existent Product');
    await tester.pump();

    expect(find.text('Product 1'), findsNothing);
    expect(find.text('Product 2'), findsNothing);
    expect(find.text('Another Product'), findsNothing);

    await tester.enterText(find.byType(TextField), '');
    await tester.pump();

    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 2'), findsOneWidget);
    expect(find.text('Another Product'), findsOneWidget);

    await tester.tap(find.text('Product 1'));
    await tester.pump();

    expect(getProductCalled, isFalse);
  });

  testWidgets('SearchTemplate handles menu interactions',
      (WidgetTester tester) async {
    bool onTapHomeCalled = false;
    bool onTapSupportCalled = false;
    bool onTapContactCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: SearchTemplate(
          onTapHome: () {
            onTapHomeCalled = true;
          },
          onTapSupport: () {
            onTapSupportCalled = true;
          },
          onTapContact: () {
            onTapContactCalled = true;
          },
        ),
      ),
    );

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    expect(onTapHomeCalled, isTrue);

    await tester.tap(find.text('Soporte'));
    await tester.pumpAndSettle();

    expect(onTapSupportCalled, isTrue);

    await tester.tap(find.text('Contacto'));
    await tester.pumpAndSettle();

    expect(onTapContactCalled, isTrue);
  });
}
