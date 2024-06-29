import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/data/product_dart.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets(
      'DetailsTemplate displays product details and handles quantity changes',
      (WidgetTester tester) async {
    // Crea un producto de prueba
    final product = Product(
      name: 'Test Product',
      description: 'This is a test product.',
      price: 99.99,
      image: null,
    );

    int quantity = 1;

    // Crea el widget
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

    // Verifica que los detalles del producto se muestran correctamente
    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('This is a test product.'), findsOneWidget);

    // Verifica que la cantidad inicial es 1
    expect(find.text('1'), findsOneWidget);

    // Simula un toque en el botón de aumentar la cantidad
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica que la cantidad ha aumentado a 2
    expect(find.text('2'), findsOneWidget);

    // Simula un toque en el botón de disminuir la cantidad
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verifica que la cantidad ha disminuido a 1
    expect(find.text('1'), findsOneWidget);

    // Desplaza hacia abajo para asegurarte de que el botón sea visible
    await tester.drag(
        find.byType(SingleChildScrollView), const Offset(0, -300));
    await tester.pumpAndSettle();

    // Simula un toque en el botón de añadir al carrito
    await tester.tap(find.text('Añadir al carrito'));
    await tester.pumpAndSettle();

    // Verifica que el callback onAddToCart fue llamado con la cantidad correcta
    expect(quantity, 1);
  });
}
