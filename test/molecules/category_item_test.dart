import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('CategoryItem displays title with correct style',
      (WidgetTester tester) async {
    const testTitle = 'Test Category';
    const testCategoryHeight = 100.0;
    const testColor = Colors.red;

    // Build the widget inside a MaterialApp to provide necessary context
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CategoryItem(
            title: testTitle,
            categoryHeight: testCategoryHeight,
            color: testColor,
          ),
        ),
      ),
    );

    // Verifica que el título se muestra correctamente
    expect(find.text(testTitle), findsOneWidget);

    // Verifica que el estilo del texto es el correcto
    final textWidget = tester.widget<Text>(find.text(testTitle));
    expect(textWidget.style?.fontWeight, FontWeight.bold);
    expect(textWidget.style?.color, testColor);

    // Verifica que el ancho del contenedor es correcto
    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox.width, testCategoryHeight);
  });
}
