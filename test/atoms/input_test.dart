import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('AppInput applies colorInput correctly',
      (WidgetTester tester) async {
    final controller = TextEditingController();

    const colorInput = Colors.red;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppInput(
            controller: controller,
            hintText: 'Enter text',
            colorInput: colorInput,
          ),
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    final decoration = textField.decoration as InputDecoration;

    expect(decoration.fillColor, colorInput);
    expect(decoration.hintStyle?.color, colorInput);
    expect(decoration.iconColor, colorInput);
    expect(decoration.enabledBorder?.borderSide.color, colorInput);
    expect(decoration.focusedBorder?.borderSide.color, colorInput);
    expect(decoration.border?.borderSide.color, colorInput);
    expect(textField.cursorColor, colorInput);
    expect(textField.style?.color, colorInput);
  });
}
