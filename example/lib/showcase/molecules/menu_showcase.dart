import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class MenuShowcase extends StatelessWidget {
  const MenuShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Menu(
        isHome: true,
        isScrolling: false,
        hasMenu: (openMenu) {},
      ),
    );
  }
}
