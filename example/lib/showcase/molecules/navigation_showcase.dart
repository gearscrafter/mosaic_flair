import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class NavigationShowcase extends StatelessWidget {
  const NavigationShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return AppNavigationBar(
      currentIndex: 0,
      items: const [],
      onTap: (value) {},
    );
  }
}
