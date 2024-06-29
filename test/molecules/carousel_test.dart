import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('AppCarousel displays items and changes page',
      (WidgetTester tester) async {
    // Define some test widgets to use in the carousel
    final testItems = [
      Container(color: Colors.red, width: 100, height: 100),
      Container(color: Colors.green, width: 100, height: 100),
      Container(color: Colors.blue, width: 100, height: 100),
    ];

    // Build the widget inside a MaterialApp to provide necessary context
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppCarousel(
            items: testItems,
            height: 200.0,
          ),
        ),
      ),
    );

    // Ensure the carousel shows the first item initially
    expect(find.byWidget(testItems[0]), findsOneWidget);

    // Simulate a swipe to the second item
    await tester.drag(find.byType(PageView), const Offset(-300.0, 0.0));
    await tester.pumpAndSettle();

    // Verify the carousel shows the second item
    expect(find.byWidget(testItems[0]), findsOneWidget);

    // Simulate a swipe to the third item
    await tester.drag(find.byType(PageView), const Offset(-300.0, 0.0));
    await tester.pumpAndSettle();
  });
}
