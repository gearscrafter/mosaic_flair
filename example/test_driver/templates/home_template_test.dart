import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('HomeTemplate displays user name, promotions, and products',
      (WidgetTester tester) async {
    final promotionCards = [
      const PromotionCard(
        description: 'Descuento al 50%',
        image: null,
        percentage: 50,
      ),
      const PromotionCard(
        description: 'Descuento al 30%',
        image: null,
        percentage: 30,
      ),
    ];

    final products = [
      const ProductCard(
        id: 1,
        title: 'Product 1',
        category: 'category',
        image: null,
        price: 29.99,
      ),
      const ProductCard(
        id: 2,
        title: 'Product 2',
        category: 'category',
        image: null,
        price: 49.99,
      ),
    ];

    bool seeMoreTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: HomeTemplate(
          userName: 'John Doe',
          promotionCards: promotionCards,
          onTapSeeMore: () {
            seeMoreTapped = true;
          },
          onTapHome: () {},
          products: products,
        ),
      ),
    );

    expect(find.text('Hola, John Doe'), findsOneWidget);

    expect(find.text('Descuento al 50%'), findsOneWidget);
    expect(find.text('Descuento al 30%'), findsNothing);

    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 2'), findsOneWidget);

    await tester.tap(find.text('Ver más'));
    await tester.pumpAndSettle();

    expect(seeMoreTapped, isTrue);
  });
}
