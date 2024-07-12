import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';
import 'text.dart';

/// `Support` es un widget que representa un elemento de soporte con un ícono, un texto y una funcionalidad
/// para copiar información al portapapeles y mostrar un mensaje emergente.
///
/// ### Atributos:
/// - `label`: El texto que se muestra como etiqueta del soporte.
/// - `info`: La información que se muestra en el mensaje emergente cuando se hace clic.
/// - `icon`: El ícono que se muestra al lado de la etiqueta.

class Support extends StatelessWidget {
  /// El texto que se muestra como etiqueta del soporte.
  final String label;

  /// La información que se muestra en el mensaje emergente cuando se hace clic.
  final String info;

  /// El ícono que se muestra al lado de la etiqueta.
  final IconData icon;

  /// Constructor para crear una instancia de `Support`.
  const Support({
    required this.icon,
    required this.label,
    required this.info,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      /// Decoración del contenedor con borde y bordes redondeados.
      decoration: BoxDecoration(
        border: Border.all(
          color: accentColor1,
        ),
        borderRadius:
            const BorderRadius.all(Radius.circular(borderRadiusDimensions)),
      ),

      /// Contenido del ListTile con ícono, etiqueta y funcionalidad de clic.
      child: ListTile(
        /// Ícono que se muestra al lado de la etiqueta.
        leading: Icon(icon),

        /// Etiqueta del soporte.
        title: AppText(text: label),

        /// Función que se ejecuta cuando se hace clic en el ListTile.
        onTap: () {
          /// Copia el texto de la etiqueta al portapapeles.
          Clipboard.setData(ClipboardData(text: label));

          /// Muestra un mensaje emergente con la información proporcionada.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: AppText(
                text: info,
                textColor: backgroundColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
