import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('Menu widget displays and handles interactions correctly',
      (WidgetTester tester) async {
    bool isHomeTapped = false;
    bool isProductsTapped = false;
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
            onTapProducts: () {
              isProductsTapped = true;
            },
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

    // Verifica que los elementos iniciales del menú no se muestran
    expect(find.text('Home'), findsOne);
    expect(find.text('Productos'), findsNothing);
    expect(find.text('Soporte'), findsOne);
    expect(find.text('Contacto'), findsOne);

    // Simula un toque en el botón de menú para abrirlo
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Verifica que los elementos del menú se muestran después de abrirlo
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Soporte'), findsOneWidget);
    expect(find.text('Contacto'), findsOneWidget);

    // Simula un toque en el botón de "Home"
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(isHomeTapped, isTrue);

    // Simula un toque en el botón de "Soporte"
    await tester.tap(find.text('Soporte'));
    await tester.pumpAndSettle();
    expect(isSupportTapped, isTrue);

    // Simula un toque en el botón de "Contacto"
    await tester.tap(find.text('Contacto'));
    await tester.pumpAndSettle();
    expect(isContactTapped, isTrue);

    // Simula un toque en el botón de cierre de menú
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Verifica que los elementos del menú no se muestran después de cerrarlo
    expect(find.text('Home'), findsOne);
    expect(find.text('Soporte'), findsOne);
    expect(find.text('Contacto'), findsOne);
    expect(isMenuOpen, isFalse);
  });
}
