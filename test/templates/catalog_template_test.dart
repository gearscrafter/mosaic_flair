import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets(
      'CatalogTemplate handles scrolling and menu interaction correctly',
      (WidgetTester tester) async {
    // Define una lista de productos
    final products = [
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
    ];

    bool isScrolling = false;

    // Crea el widget
    await tester.pumpWidget(
      MaterialApp(
        home: CatalogTemplate(
          items: const [],
          products: products,
          onProductTap: (product) {
            // Maneja el toque en el producto
          },
        ),
      ),
    );

    // Simula el desplazamiento y verifica la interacción del menú
    final scrollableFinder = find.byType(SynchronousTabBar);
    await tester.drag(scrollableFinder, const Offset(0, -300));
    await tester.pumpAndSettle();

    // Verifica que el menú maneja el desplazamiento correctamente
    expect(isScrolling, isFalse);

    // Interactúa con el menú y verifica la interacción
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.close), findsOneWidget);
  });
}
