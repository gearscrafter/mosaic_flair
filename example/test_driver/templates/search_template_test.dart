import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mosaic_flair/data/product_dart.dart';
import 'package:mosaic_flair/mosaic_flair.dart';
import 'package:mockito/mockito.dart';

class MockProduct extends Mock implements Product {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('SearchTemplate displays products and handles search',
      (WidgetTester tester) async {
    // Mock data
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

    // Verifica que los productos se muestran inicialmente
    expect(find.text('Product 1'), findsAny);
    expect(find.text('Product 2'), findsOneWidget);
    expect(find.text('Another Product'), findsOneWidget);

    // Realiza una búsqueda
    await tester.enterText(find.byType(TextField), 'Product 1');
    await tester.pump();

    // Verifica que solo se muestra el producto que coincide con la búsqueda
    expect(find.text('Product 1'), findsAny);
    expect(find.text('Product 2'), findsNothing);
    expect(find.text('Another Product'), findsNothing);

    // Realiza una búsqueda que no coincida
    await tester.enterText(find.byType(TextField), 'Non-existent Product');
    await tester.pump();

    // Verifica que no se muestra ningún producto
    expect(find.text('Product 1'), findsNothing);
    expect(find.text('Product 2'), findsNothing);
    expect(find.text('Another Product'), findsNothing);

    // Limpia la búsqueda
    await tester.enterText(find.byType(TextField), '');
    await tester.pump();

    // Verifica que todos los productos se muestran nuevamente
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 2'), findsOneWidget);
    expect(find.text('Another Product'), findsOneWidget);

    // Simula un toque en el primer producto
    await tester.tap(find.text('Product 1'));
    await tester.pump();

    // Verifica que se llamó a la función getProduct
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

    // Simula un toque en el menú de inicio
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    // Verifica que se llamó a la función onTapHome
    expect(onTapHomeCalled, isTrue);

    // Simula un toque en el menú de soporte
    await tester.tap(find.text('Soporte'));
    await tester.pumpAndSettle();

    // Verifica que se llamó a la función onTapSupport
    expect(onTapSupportCalled, isTrue);

    // Simula un toque en el menú de contacto
    await tester.tap(find.text('Contacto'));
    await tester.pumpAndSettle();

    // Verifica que se llamó a la función onTapContact
    expect(onTapContactCalled, isTrue);
  });
}
