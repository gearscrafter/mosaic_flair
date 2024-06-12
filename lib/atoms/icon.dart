import 'package:flutter/material.dart';

import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

class AppIcon extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final double size;

  const AppIcon({
    super.key,
    required this.iconData,
    this.color = onSurfaceColor,
    this.size = paddingLargeDimension,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color,
      size: size,
    );
  }
}
