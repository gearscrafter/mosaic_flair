import 'dart:ui';

import '../core/app_config.dart';

final appConfig = AppConfig();

/// Un tono marrón rojizo para botones principales, encabezados, y elementos de énfasis.
Color primary = appConfig.getColor('primary', const Color(0xFFA67C72));

/// Un color gris muy claro, ideal para fondos generales y crear espacios limpios.
Color background = appConfig.getColor('background', const Color(0xFFF2F2F2));

/// Un gris claro, útil para secciones de fondo alternativo, tarjetas, o paneles.
Color secondaryBackground =
    appConfig.getColor('secondaryBackground', const Color(0xFFD9D9D9));

/// Un gris mediano para texto secundario, íconos, bordes o elementos de menor jerarquía.
Color neutral = appConfig.getColor('neutral', const Color(0xFFA6A6A6));

/// Un tono naranja cálido para botones de llamada a la acción, promociones y elementos interactivos.
Color accent1 = appConfig.getColor('accent1', const Color(0xFFFFB347));

/// Un color verde azulado para elementos de resaltado y acento en componentes interactivos.
Color accent2 = appConfig.getColor('accent2', const Color(0xFF79C7C5));

/// Un verde para estados de éxito, confirmaciones, y mensajes positivos.
Color success = appConfig.getColor('success', const Color(0xFF5BBD72));

/// Un tono coral para advertencias, alertas, o notificaciones importantes.
Color warning = appConfig.getColor('warning', const Color(0xFFFF7F50));

/// Un rojo claro para mensajes de error y validación negativa.
Color error = appConfig.getColor('error', const Color(0xFFE57373));

/// Un gris oscuro casi negro para el texto principal que asegura buena legibilidad.
final Color textPrimary =
    appConfig.getColor('textPrimary', const Color(0xFF333333));
