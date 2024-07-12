import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets(
      'AppDropdownButton displays hint and items, triggers onItemSelected',
      (WidgetTester tester) async {
    Widget? selectedItem;
    const hint = Text('Select an item');
    final items = [
      const Text('Item 1'),
      const Text('Item 2'),
      const Text('Item 3'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              AppDropdownButton(
                hint: hint,
                items: items,
                onItemSelected: (item) {
                  selectedItem = item;
                },
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Select an item'), findsOneWidget);

    await tester.tap(find.text('Select an item'));
    await tester.pumpAndSettle();

    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
    expect(find.text('Item 3'), findsOneWidget);

    await tester.tap(find.text('Item 2').last);
    await tester.pumpAndSettle();

    expect(find.text('Item 2'), findsOneWidget);

    expect(selectedItem, isNotNull);
    expect((selectedItem as Text).data, 'Item 2');
  });
}
