import 'package:flutter/material.dart';
import '../atoms/button.dart';
import '../atoms/text.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

class PromotionCard extends StatelessWidget {
  final String? description;
  final String? extentDescription;
  final String? image;
  final double percentage;

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
                    ),
                  Row(
                    children: [
                      Text(
                        '${percentage.toStringAsFixed(0)} %',
                        style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                      if (description != null)
                        AppText(
                          text: extentDescription,
                          sizeText: SizeText.S,
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: AppButton(
                        label: 'Get it now',
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
