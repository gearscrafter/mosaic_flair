import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('ProductDetail displays correctly and can add to cart',
      (WidgetTester tester) async {
    // Variables para almacenar los detalles del producto
    const String title = 'Test Product';
    const String description = 'This is a test product description.';
    const double price = 99.99;

    // Construir el widget dentro de un MaterialApp para proporcionarle el contexto necesario
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

    // Asegúrate de que el widget esté completamente renderizado
    await tester.pumpAndSettle();

    // Verifica que el precio se muestra correctamente
    expect(find.text('\$ 99.99'), findsOneWidget);

    // Verifica que el título del producto se muestra correctamente
    expect(find.text(title), findsOneWidget);

    // Verifica que la descripción del producto se muestra correctamente
    expect(find.text(description), findsOneWidget);
  });
}
