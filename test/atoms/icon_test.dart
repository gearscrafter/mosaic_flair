import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

void main() {
  testWidgets('AppIcon displays correctly with given properties',
      (WidgetTester tester) async {
    const iconData = Icons.home;
    const color = Colors.blue;
    const backgroundColor = Colors.red;
    const size = 30.0;
    const sizeContainer = 50.0;
    const hasShadow = true;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppIcon(
              iconData: iconData,
              color: color,
              backgroundColor: backgroundColor,
              size: size,
              sizeContainer: sizeContainer,
              hasShadow: hasShadow,
            ),
          ),
        ),
      ),
    );

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;

    expect(container.constraints?.maxHeight, sizeContainer);
    expect(container.constraints?.maxWidth, sizeContainer);
    expect(decoration.color, backgroundColor);
    expect(decoration.shape, BoxShape.circle);
    if (hasShadow) {
      expect(decoration.boxShadow?.isNotEmpty, true);
    }

    // Verificar que el Icon tiene las propiedades correctas
    final icon = tester.widget<Icon>(find.byType(Icon));
    expect(icon.icon, iconData);
    expect(icon.color, color);
    expect(icon.size, size);
  });
}
