import 'package:flutter/material.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final String category;
  final double price;
  final double topBoxHeight;
  final double bottomBoxHeight;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.category,
    required this.image,
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
                        padding: const EdgeInsets.all(paddingMediumDimension),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(title,
                                  style: const TextStyle(
                                      color: textColorPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: fontSizeLargeDimension)),
                              Text(category,
                                  style: const TextStyle(
                                      color: neutralColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: fontSizeMediumDimension)),
                              Text('\$$price',
                                  style: const TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: fontSizeMediumDimension)),
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
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: size.width / 3,
                  height: 120,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
