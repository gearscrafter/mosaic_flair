import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class TileCardShowcase extends StatelessWidget {
  const TileCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(paddingMediumDimension),
        child: TileCard(
          title: 'producto',
          height: 80,
          image: 'https://prd.place/400/600',
          onPressed: () {},
          price: 20.0,
        ),
      ),
    );
  }
}
