import 'package:flutter/material.dart';

import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

class AppIcon extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final Color backgroundColor;
  final double size;
  final bool hasShadow;
  final double sizeContainer;

  const AppIcon({
    super.key,
    required this.iconData,
    this.hasShadow = false,
    this.sizeContainer = 40.0,
    this.backgroundColor = Colors.white,
    this.color = neutralColor,
    this.size = paddingLargeDimension,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeContainer,
      width: sizeContainer,
      decoration: BoxDecoration(
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
          color: backgroundColor,
          shape: BoxShape.circle),
      child: Icon(
        iconData,
        color: color,
        size: size,
      ),
    );
  }
}
