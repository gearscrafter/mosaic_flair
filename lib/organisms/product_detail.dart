import 'package:flutter/material.dart';
import 'package:mosaic_flair/mosaic_flair.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final double price;

  const ProductDetail({
    super.key,
    required this.title,
    required this.description,
    this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        image != null
            ? Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadiusDimensions),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 0.7,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadiusDimensions),
                  child: image != null
                      ? Image.network(image!,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity)
                      : const SizedBox.shrink(),
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 40,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '\$ ${price.toStringAsFixed(2)}',
              overflow: TextOverflow.fade,
              style: const TextStyle(
                  fontSize: fontSizeLargeDimension,
                  color: primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: size.width * 0.85),
          padding: const EdgeInsets.all(16.0),
          child: Text(description),
        ),
      ],
    );
  }
}
