import 'package:flutter/material.dart';
import '../foundation/dimension_foundation.dart';

/// `SizeText` enum para definir tamaños de texto.
enum SizeText { S, M, L }

/// `AppText` es un widget personalizado para mostrar texto con estilos configurables.
///
/// ### Atributos:
/// - `text`: El texto que se mostrará (obligatorio si `isRichText` es falso).
/// - `textSpans`: Una lista de `TextSpan` para mostrar texto enriquecido (obligatorio si `isRichText` es verdadero).
/// - `style`: El estilo del texto.
/// - `textColor`: El color del texto.
/// - `textAlign`: La alineación del texto.
/// - `isRichText`: Indica si el texto es enriquecido.
/// - `sizeText`: El tamaño del texto (S, M, L).
/// - `maxLines`: El número máximo de líneas.
/// - `overflow`: Cómo manejar el desbordamiento del texto.
/// - `fontWeight`: El grosor del texto.

class AppText extends StatelessWidget {
  /// El texto que se mostrará (obligatorio si `isRichText` es falso).
  final String? text;

  /// Una lista de `TextSpan` para mostrar texto enriquecido (obligatorio si `isRichText` es verdadero).
  final List<TextSpan>? textSpans;

  /// El estilo del texto.
  final TextStyle? style;

  /// El color del texto.
  final Color textColor;

  /// La alineación del texto.
  final TextAlign textAlign;

  /// Indica si el texto es enriquecido.
  final bool isRichText;

  /// El tamaño del texto (S, M, L).
  final SizeText sizeText;

  /// El número máximo de líneas.
  final int? maxLines;

  /// Cómo manejar el desbordamiento del texto.
  final TextOverflow? overflow;

  /// El grosor del texto.
  final FontWeight? fontWeight;

  /// Constructor para crear una instancia de `AppText`.
  const AppText({
    this.text,
    super.key,
    this.fontWeight,
    this.textColor = Colors.black,
    this.isRichText = false,
    this.textSpans,
    this.maxLines,
    this.overflow,
    this.sizeText = SizeText.M,
    this.style,
    this.textAlign = TextAlign.left,
  }) : assert(isRichText ? textSpans != null : text != null,
            'Provide text for plain text or textSpans for rich text.');

  @override
  Widget build(BuildContext context) {
    /// Estilo efectivo del texto, basado en los parámetros proporcionados.
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
            maxLines: maxLines,
            overflow: overflow,
            style: effectiveStyle,
            textAlign: textAlign,
          );
  }
}
