import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  group('AppButton Tests', () {
    testWidgets('AppButton displays label and triggers onPressed',
        (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Test Button',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);

      await tester.tap(find.byType(AppButton));
      await tester.pumpAndSettle();

      expect(pressed, true);
    });

    testWidgets('AppButton shows icon animation when hasIconAnimation is true',
        (WidgetTester tester) async {
      final iconAnimationController = AnimationController(
        vsync: tester,
        duration: const Duration(milliseconds: 600),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Test Button',
              hasIconAnimation: true,
              onPressed: () {},
              iconAnimationController: iconAnimationController,
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);

      expect(find.byIcon(Icons.arrow_forward_sharp), findsOneWidget);

      iconAnimationController.stop();
    });

    testWidgets('AppButton is disabled when onPressed is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Test Button',
              onPressed: null,
            ),
          ),
        ),
      );

      final Finder button = find.byType(ElevatedButton);
      final ElevatedButton elevatedButton = tester.widget(button);
      expect(elevatedButton.onPressed, null);
    });
  });
}
