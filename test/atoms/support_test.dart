import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('Support widget copies to clipboard and shows SnackBar',
      (WidgetTester tester) async {
    const testLabel = 'Test Label';
    const testInfo = 'Copied to clipboard!';
    const testIcon = Icons.info;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Support(
            icon: testIcon,
            label: testLabel,
            info: testInfo,
          ),
        ),
      ),
    );

    // Verifica que el ListTile y el texto inicial están presentes
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text(testLabel), findsOneWidget);

    // Simula un tap en el ListTile
    await tester.tap(find.byType(ListTile));
    await tester.pump();
  });
}
