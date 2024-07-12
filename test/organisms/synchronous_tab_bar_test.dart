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

    expect(
        find.byWidgetPredicate(
            (widget) => widget is CategoryCard && widget.title == 'category1'),
        findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is CategoryCard && widget.title == 'category2'),
        findsOneWidget);

    expect(find.text('product1'), findsOneWidget);
    expect(find.text('product2'), findsOneWidget);
    expect(find.text('product3'), findsOneWidget);
    expect(find.text('product4'), findsOneWidget);

    await tester.tap(find.byWidgetPredicate(
        (widget) => widget is CategoryCard && widget.title == 'category2'));
    await tester.pumpAndSettle();

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

    expect(find.text('product1'), findsOneWidget);
    expect(find.text('product2'), findsOneWidget);
    expect(find.text('product3'), findsOneWidget);
    expect(find.text('product4'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pumpAndSettle();

    expect(find.text('product3'), findsOneWidget);
    expect(find.text('product4'), findsOneWidget);
  });
}
