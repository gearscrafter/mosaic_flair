import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets(
      'ProcessButton displays correct text and triggers onTap callbacks',
      (WidgetTester tester) async {
    int currentIndex = 0;
    bool leftTapped = false;
    bool centerTapped = false;
    bool rightTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProcessButton(
            steps: const ["Step 1", "Step 2", "Step 3"],
            onTextChange: (index) {
              currentIndex = index;
            },
            leftOnTap: () {
              leftTapped = true;
            },
            centerOnTap: () {
              centerTapped = true;
            },
            rightOnTap: () {
              rightTapped = true;
            },
          ),
        ),
      ),
    );

    expect(find.text("Step 1"), findsOneWidget);

    await tester.tap(find.byType(GestureDetector).at(1));
    await tester.pumpAndSettle();

    expect(currentIndex, 0);
    expect(find.text("Step 1"), findsOneWidget);

    await tester.tap(find.byType(GestureDetector).at(1));
    await tester.pumpAndSettle();

    expect(currentIndex, 1);
    expect(find.text("Step 2"), findsOneWidget);

    await tester.tap(find.byType(GestureDetector).at(1));
    await tester.pumpAndSettle();

    expect(leftTapped, isFalse);
    expect(centerTapped, isTrue);
    expect(rightTapped, isFalse);

    await tester.tap(find.byType(GestureDetector).at(0));
    await tester.pumpAndSettle();
    expect(leftTapped, isTrue);

    await tester.tap(find.byType(GestureDetector).at(2));
    await tester.pumpAndSettle();
    expect(rightTapped, isTrue);
  });
}
