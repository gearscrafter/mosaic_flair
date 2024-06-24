import 'package:flutter/material.dart';

import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

class AppCarousel extends StatefulWidget {
  final List<Widget> items;
  final double height;

  const AppCarousel({
    super.key,
    required this.items,
    this.height = 200.0,
  });

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(paddingMediumDimension),
                child: widget.items[index],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.items.length,
            (index) => _buildDot(index),
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? primaryColor : secondaryBackgroundColor,
      ),
    );
  }
}
