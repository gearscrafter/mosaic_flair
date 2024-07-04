import 'package:flutter/material.dart';

import '../atoms/icon.dart';
import '../atoms/text.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

class TileCard extends StatelessWidget {
  final String? title;
  final String? image;
  final double? price;
  final double height;
  final VoidCallback? onPressed;
  const TileCard(
      {this.onPressed,
      this.height = 80,
      this.title,
      this.image,
      this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius:
              const BorderRadius.all(Radius.circular(borderRadiusDimensions))),
      child: Center(
        child: ListTile(
            title: (title != null)
                ? AppText(
                    text: title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: fontSizeLargeDimension,
                        fontWeight: FontWeight.bold,
                        color: textColorPrimary),
                  )
                : const SizedBox.shrink(),
            leading: (image != null)
                ? SizedBox(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(borderRadiusDimensions),
                      child: Image.network(
                        image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            subtitle: (price != null)
                ? AppText(
                    text: '\$ $price',
                    style: const TextStyle(
                        fontSize: fontSizeMediumDimension,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  )
                : const SizedBox.shrink(),
            trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: textColorPrimary,
                  disabledBackgroundColor: Colors.white,
                  overlayColor: secondaryBackgroundColor,
                  elevation: 2,
                  padding: const EdgeInsets.all(paddingMediumDimension),
                ),
                onPressed: onPressed,
                child: const AppIcon(
                    backgroundColor: Colors.white,
                    iconData: Icons.shopping_cart_outlined))),
      ),
    );
  }
}
