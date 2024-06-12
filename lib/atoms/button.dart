import 'package:atomic_design_system/foundation/color_foundation.dart';
import 'package:flutter/material.dart';

import '../foundation/dimension_foundation.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const AppButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
        padding: const EdgeInsets.all(paddingMediumDimension),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
