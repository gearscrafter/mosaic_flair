import 'package:flutter/material.dart';

import '../atoms/icon.dart';
import '../atoms/text.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

/// `TileCard` es un widget que representa una tarjeta de producto en forma de tile.
///
/// ### Atributos:
/// - `title`: El título del producto (opcional).
/// - `image`: La URL de la imagen del producto (opcional).
/// - `price`: El precio del producto (opcional).
/// - `height`: La altura de la tarjeta (por defecto es 80).
/// - `onPressed`: Callback que se ejecuta cuando se presiona el botón de la tarjeta (opcional).

class TileCard extends StatelessWidget {
  /// El título del producto (opcional).
  final String? title;

  /// La URL de la imagen del producto (opcional).
  final String? image;

  /// El precio del producto (opcional).
  final double? price;

  /// La altura de la tarjeta (por defecto es 80).
  final double height;

  /// Callback que se ejecuta cuando se presiona el botón de la tarjeta (opcional).
  final VoidCallback? onPressed;

  /// Constructor para crear una instancia de `TileCard`.
  const TileCard({
    this.onPressed,
    this.height = 80,
    this.title,
    this.image,
    this.price,
    super.key,
  });

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
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadiusDimensions),
        ),
      ),
      child: Center(
        child: ListTile(
          title: (title != null)
              ? AppText(
                  text: title,
                  maxLines: 1,
                  textColor: textColorPrimary,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: fontSizeLargeDimension,
                    fontWeight: FontWeight.bold,
                    color: textColorPrimary,
                  ),
                )
              : const SizedBox.shrink(),
          leading: (image != null)
              ? SizedBox(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadiusDimensions),
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
                  style: TextStyle(
                    fontSize: fontSizeMediumDimension,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                )
              : const SizedBox.shrink(),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: textColorPrimary,
              disabledBackgroundColor: Colors.white,
              overlayColor: secondaryBackgroundColor,
              elevation: 2,
              padding: EdgeInsets.all(paddingMediumDimension),
            ),
            onPressed: onPressed,
            child: AppIcon(
              backgroundColor: Colors.white,
              iconData: Icons.shopping_cart_outlined,
              color: neutralColor,
              size: paddingLargeDimension,
            ),
          ),
        ),
      ),
    );
  }
}
