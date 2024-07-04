import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class SynchronousTabBarShowcase extends StatefulWidget {
  const SynchronousTabBarShowcase({super.key});

  @override
  State<SynchronousTabBarShowcase> createState() =>
      _SynchronousTabBarShowcaseState();
}

class _SynchronousTabBarShowcaseState extends State<SynchronousTabBarShowcase> {
  void _updateScrolling(bool isScrolling) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SynchronousTabBar(
        onScrollChange: _updateScrolling,
      ),
    );
  }
}
