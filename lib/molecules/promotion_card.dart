import 'package:flutter/material.dart';
import '../atoms/button.dart';
import '../atoms/text.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

/// `PromotionCard` es un widget que representa una tarjeta de promoción con una imagen, un porcentaje de descuento y una descripción.
///
/// ### Atributos:
/// - `description`: La descripción de la promoción (opcional).
/// - `extentDescription`: Una descripción extendida de la promoción (opcional).
/// - `image`: La URL de la imagen de la promoción (requerido).
/// - `percentage`: El porcentaje de descuento de la promoción (requerido).

class PromotionCard extends StatelessWidget {
  /// La descripción de la promoción (opcional).
  final String? description;

  /// Una descripción extendida de la promoción (opcional).
  final String? extentDescription;

  /// La URL de la imagen de la promoción (requerido).
  final String? image;

  /// El porcentaje de descuento de la promoción (requerido).
  final double percentage;

  /// Constructor para crear una instancia de `PromotionCard`.
  const PromotionCard({
    this.description,
    this.extentDescription,
    required this.image,
    required this.percentage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadiusDimensions),
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.72),
                        Colors.transparent,
                      ],
                      stops: const [0.45, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcOver,
                  child: image != null
                      ? Image.network(
                          image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (description != null)
                    AppText(
                      text: description,
                      sizeText: SizeText.S,
                      textColor: textColorPrimary,
                    ),
                  Row(
                    children: [
                      Text(
                        '${percentage.toStringAsFixed(0)} %',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                      if (extentDescription != null)
                        AppText(
                          text: extentDescription,
                          sizeText: SizeText.M,
                          textColor: textColorPrimary,
                          fontWeight: FontWeight.w400,
                        ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: AppButton(
                        labelColor: textColorPrimary,
                        label: 'Obténlo ahora',
                        width: 150,
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
