import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('ProductList displays products and triggers events correctly',
      (WidgetTester tester) async {
    // Lista de productos de prueba
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

    // Variables para verificar si se llaman las funciones de callback
    int selectedProductId = -1;
    bool isProductSelectedTapped = false;
    bool isScrolling = false;

    // Construir el widget dentro de un MaterialApp para proporcionarle el contexto necesario
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

    // Asegúrate de que el widget esté completamente renderizado
    await tester.pumpAndSettle();

    // Verifica que los productos se muestran correctamente
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 2'), findsOneWidget);

    // Simula un toque en el primer producto
    await tester.tap(find.text('Product 1'));
    await tester.pumpAndSettle();

    // Verifica que el evento de selección del producto se activa correctamente
    expect(selectedProductId, 1);
    expect(isProductSelectedTapped, isTrue);

    // Simula el desplazamiento de la lista de productos
    await tester.drag(find.byType(GridView), const Offset(0, -300));
    await tester.pumpAndSettle();

    // Verifica que el evento de desplazamiento se maneja correctamente
    expect(isScrolling, isFalse);
  });
}
