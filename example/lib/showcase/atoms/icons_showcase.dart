import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class IconsShowcase extends StatelessWidget {
  const IconsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iconos'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              AppIcon(
                iconData: Icons.home,
                color: primaryColor,
              ),
              AppIcon(
                iconData: Icons.star,
                color: primaryColor,
              ),
              AppIcon(
                iconData: Icons.shopping_cart,
                color: backgroundColor,
              ),
              AppIcon(
                iconData: Icons.favorite,
                color: warningColor,
              ),
              AppIcon(
                iconData: Icons.search,
                color: successColor,
              ),
              AppIcon(
                iconData: Icons.filter_alt_rounded,
                color: accentColor1,
              ),
              AppIcon(
                iconData: Icons.account_circle,
                color: accentColor2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
