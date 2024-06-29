import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/data/category_data.dart';
import 'package:mosaic_flair/data/product_dart.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('SynchronousTabBar displays categories and products correctly',
      (WidgetTester tester) async {
    final categories = [
      Category(name: 'category1', products: [
        Product(
            name: 'product1',
            description: 'description1',
            price: 10.0,
            image: null),
        Product(
            name: 'product2',
            description: 'description2',
            price: 20.0,
            image: null),
      ]),
      Category(name: 'category2', products: [
        Product(
            name: 'product3',
            description: 'description3',
            price: 30.0,
            image: null),
        Product(
            name: 'product4',
            description: 'description4',
            price: 40.0,
            image: null),
      ]),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SynchronousTabBar(items: categories),
        ),
      ),
    );

    // Verifica que las categorías se muestran correctamente en la barra de pestañas
    expect(
        find.byWidgetPredicate(
            (widget) => widget is CategoryCard && widget.title == 'category1'),
        findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is CategoryCard && widget.title == 'category2'),
        findsOneWidget);

    // Verifica que los productos se muestran correctamente
    expect(find.text('product1'), findsOneWidget);
    expect(find.text('product2'), findsOneWidget);
    expect(find.text('product3'), findsOneWidget);
    expect(find.text('product4'), findsOneWidget);

    // Desliza hacia la segunda categoría
    await tester.tap(find.byWidgetPredicate(
        (widget) => widget is CategoryCard && widget.title == 'category2'));
    await tester.pumpAndSettle();

    // Verifica que los productos de la segunda categoría se muestran correctamente
    expect(find.text('product3'), findsOneWidget);
    expect(find.text('product4'), findsOneWidget);
    expect(find.text('product1'), findsOneWidget);
    expect(find.text('product2'), findsOneWidget);
  });

  testWidgets('SynchronousTabBar handles scrolling correctly',
      (WidgetTester tester) async {
    final categories = [
      Category(name: 'category1', products: [
        Product(
            name: 'product1',
            description: 'description1',
            price: 10.0,
            image: null),
        Product(
            name: 'product2',
            description: 'description2',
            price: 20.0,
            image: null),
      ]),
      Category(name: 'category2', products: [
        Product(
            name: 'product3',
            description: 'description3',
            price: 30.0,
            image: null),
        Product(
            name: 'product4',
            description: 'description4',
            price: 40.0,
            image: null),
      ]),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SynchronousTabBar(items: categories),
        ),
      ),
    );

    // Verifica que los productos de la primera categoría se muestran correctamente
    expect(find.text('product1'), findsOneWidget);
    expect(find.text('product2'), findsOneWidget);
    expect(find.text('product3'), findsOneWidget);
    expect(find.text('product4'), findsOneWidget);

    // Desplaza hacia abajo para ver los productos de la segunda categoría
    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pumpAndSettle();

    // Verifica que los productos de la segunda categoría se muestran correctamente
    expect(find.text('product3'), findsOneWidget);
    expect(find.text('product4'), findsOneWidget);
  });
}
