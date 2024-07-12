import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('Appbar displays icons and triggers onTap callbacks',
      (WidgetTester tester) async {
    bool searchTapped = false;
    bool cartTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              Appbar(
                openMenu: false,
                onTapSearch: () {
                  searchTapped = true;
                },
                onTapCart: () {
                  cartTapped = true;
                },
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.all_inclusive_rounded), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();
    expect(searchTapped, isTrue);

    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pumpAndSettle();
    expect(cartTapped, isTrue);
  });
}
