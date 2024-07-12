import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('CategoryCard displays title and correct opacity',
      (WidgetTester tester) async {
    const testTitle = 'Test Category';
    const testColor = Colors.red;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CategoryCard(
            title: testTitle,
            onSelected: true,
            color: testColor,
          ),
        ),
      ),
    );

    // Verifica que el texto del título se muestra
    expect(find.text(testTitle), findsOneWidget);

    // Verifica que la opacidad es 1 cuando está seleccionado
    final cardOpacity = tester.widget<Opacity>(find.byType(Opacity));
    expect(cardOpacity.opacity, 1.0);

    // Verifica que el color del texto es correcto
    final textWidget = tester.widget<Text>(find.text(testTitle));
    expect(textWidget.style?.color, testColor);

    // Ahora verifica el estado no seleccionado
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CategoryCard(
            title: testTitle,
            onSelected: false,
            color: testColor,
          ),
        ),
      ),
    );

    // Verifica que la opacidad es 0.5 cuando no está seleccionado
    final cardOpacityNotSelected = tester.widget<Opacity>(find.byType(Opacity));
    expect(cardOpacityNotSelected.opacity, 0.5);

    // Verifica que la elevación es 0 cuando no está seleccionado
    final cardElevation = tester.widget<Card>(find.byType(Card));
    expect(cardElevation.elevation, 0);
  });
}
