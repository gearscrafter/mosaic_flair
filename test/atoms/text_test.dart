import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('AppText displays plain text correctly',
      (WidgetTester tester) async {
    const testText = 'Test Text';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppText(
            textColor: textColorPrimary,
            text: testText,
          ),
        ),
      ),
    );

    expect(find.text(testText), findsOneWidget);
  });

  testWidgets('AppText applies custom text style', (WidgetTester tester) async {
    const testText = 'Styled Text';
    const customStyle = TextStyle(color: Colors.red, fontSize: 24);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppText(
            text: testText,
            style: customStyle,
            textColor: textColorPrimary,
          ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text(testText));
    expect(textWidget.style?.color, customStyle.color);
    expect(textWidget.style?.fontSize, customStyle.fontSize);
  });

  testWidgets('AppText applies correct size based on SizeText',
      (WidgetTester tester) async {
    const testText = 'Size Text';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              AppText(
                text: testText,
                sizeText: SizeText.S,
                textColor: textColorPrimary,
              ),
              AppText(
                text: testText,
                sizeText: SizeText.M,
                textColor: textColorPrimary,
              ),
              AppText(
                text: testText,
                sizeText: SizeText.L,
                textColor: textColorPrimary,
              ),
            ],
          ),
        ),
      ),
    );

    final smallText = tester.widget<Text>(find.text(testText).at(0));
    final mediumText = tester.widget<Text>(find.text(testText).at(1));
    final largeText = tester.widget<Text>(find.text(testText).at(2));

    expect(smallText.style?.fontSize, fontSizeSmallDimension);
    expect(mediumText.style?.fontSize, fontSizeMediumDimension);
    expect(largeText.style?.fontSize, fontSizeLargeDimension);
  });
}
