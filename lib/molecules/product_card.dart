import 'package:flutter/material.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

/// `ProductCard` es un widget que representa una tarjeta de producto con información detallada.
///
/// ### Atributos:
/// - `id`: El identificador único del producto.
/// - `title`: El título del producto.
/// - `image`: La URL de la imagen del producto (opcional).
/// - `category`: La categoría del producto.
/// - `price`: El precio del producto.
/// - `topBoxHeight`: La altura de la caja superior (por defecto es 80.0).
/// - `bottomBoxHeight`: La altura de la caja inferior (por defecto es 10.0).
/// - `onTap`: Callback que se ejecuta cuando se presiona la tarjeta del producto (opcional).

class ProductCard extends StatelessWidget {
  /// El identificador único del producto.
  final int id;

  /// El título del producto.
  final String title;

  /// La URL de la imagen del producto (opcional).
  final String? image;

  /// La categoría del producto.
  final String category;

  /// El precio del producto.
  final double price;

  /// La altura de la caja superior.
  final double topBoxHeight;

  /// La altura de la caja inferior.
  final double bottomBoxHeight;

  /// Callback que se ejecuta cuando se presiona la tarjeta del producto (opcional).
  final VoidCallback? onTap;

  /// Constructor para crear una instancia de `ProductCard`.
  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.category,
    this.image,
    required this.price,
    this.topBoxHeight = 80.0,
    this.bottomBoxHeight = 10.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 300,
      width: size.width / 2.5,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 40,
            child: SizedBox(
              width: size.width / 2.5,
              height: 220,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusDimensions),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: topBoxHeight,
                      ),
                      Padding(
                        padding: EdgeInsets.all(paddingMediumDimension),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: textColorPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSizeLargeDimension,
                                ),
                              ),
                              Text(
                                category,
                                style: TextStyle(
                                  color: neutralColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: fontSizeMediumDimension,
                                ),
                              ),
                              Text(
                                '\$$price',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSizeMediumDimension,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: bottomBoxHeight, // Ajuste dinámico
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.028,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadiusDimensions),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadiusDimensions),
                child: image != null
                    ? Image.network(
                        image!,
                        fit: BoxFit.cover,
                        width: size.width / 3,
                        height: 120,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
