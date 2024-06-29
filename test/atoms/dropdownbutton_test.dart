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

    // Verifica que el hint se muestra
    expect(find.text('Select an item'), findsOneWidget);

    // Abre el dropdown
    await tester.tap(find.text('Select an item'));
    await tester.pumpAndSettle();

    // Verifica que los items se muestran
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
    expect(find.text('Item 3'), findsOneWidget);

    // Selecciona un item
    await tester.tap(find.text('Item 2').last);
    await tester.pumpAndSettle();

    // Verifica que el item seleccionado se muestra
    expect(find.text('Item 2'), findsOneWidget);

    // Verifica que el callback onItemSelected fue llamado
    expect(selectedItem, isNotNull);
    expect((selectedItem as Text).data, 'Item 2');
  });
}
