import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('Menu widget displays and handles interactions correctly',
      (WidgetTester tester) async {
    bool isHomeTapped = false;
    bool isSupportTapped = false;
    bool isContactTapped = false;
    bool isMenuOpen = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Menu(
            isHome: true,
            onTapHome: () {
              isHomeTapped = true;
            },
            onTapProducts: () {},
            onTapSupport: () {
              isSupportTapped = true;
            },
            onTapContact: () {
              isContactTapped = true;
            },
            hasMenu: (bool openMenu) {
              isMenuOpen = openMenu;
            },
          ),
        ),
      ),
    );

    expect(find.text('Home'), findsOne);
    expect(find.text('Productos'), findsNothing);
    expect(find.text('Soporte'), findsOne);
    expect(find.text('Contacto'), findsOne);

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Soporte'), findsOneWidget);
    expect(find.text('Contacto'), findsOneWidget);

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(isHomeTapped, isTrue);

    await tester.tap(find.text('Soporte'));
    await tester.pumpAndSettle();
    expect(isSupportTapped, isTrue);

    await tester.tap(find.text('Contacto'));
    await tester.pumpAndSettle();
    expect(isContactTapped, isTrue);
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOne);
    expect(find.text('Soporte'), findsOne);
    expect(find.text('Contacto'), findsOne);
    expect(isMenuOpen, isFalse);
  });
}
