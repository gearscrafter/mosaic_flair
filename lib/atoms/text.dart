import 'package:flutter/material.dart';
import '../foundation/dimension_foundation.dart';
import '/foundation/color_foundation.dart';

enum SizeText { S, M, L }

class AppText extends StatelessWidget {
  final String? text;
  final List<TextSpan>? textSpans;
  final TextStyle? style;
  final Color textColor;
  final TextAlign textAlign;
  final bool isRichText;
  final SizeText sizeText;
  final FontWeight? fontWeight;

  const AppText({
    this.text,
    super.key,
    this.fontWeight,
    this.textColor = textColorPrimary,
    this.isRichText = false,
    this.textSpans,
    this.sizeText = SizeText.M,
    this.style,
    this.textAlign = TextAlign.left,
  }) : assert(isRichText ? textSpans != null : text != null,
            'Provide text for plain text or textSpans for rich text.');

  @override
  Widget build(BuildContext context) {
    TextStyle effectiveStyle = style ??
        TextStyle(
            color: textColor,
            fontSize: sizeText == SizeText.L
                ? fontSizeLargeDimension
                : (sizeText == SizeText.M)
                    ? fontSizeMediumDimension
                    : fontSizeSmallDimension,
            fontWeight: fontWeight);

    return isRichText
        ? RichText(
            textAlign: textAlign,
            text: TextSpan(
              children: textSpans,
              style: effectiveStyle,
            ),
          )
        : Text(
            text ?? '',
            style: effectiveStyle,
            textAlign: textAlign,
          );
  }
}
