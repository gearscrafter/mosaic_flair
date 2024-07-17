// lib/foundation/dimension_foundation.dart
import '../core/app_config.dart';

final appConfig = AppConfig();

final double paddingSmall = appConfig.getDouble('paddingSmall', 8.0);
final double paddingMedium = appConfig.getDouble('paddingMedium', 16.0);
final double paddingLarge = appConfig.getDouble('paddingLarge', 24.0);

final double fontSizeSmall = appConfig.getDouble('fontSizeSmall', 14.0);
final double fontSizeMedium = appConfig.getDouble('fontSizeMedium', 18.0);
final double fontSizeLarge = appConfig.getDouble('fontSizeLarge', 24.0);

final double borderRadius = appConfig.getDouble('borderRadius', 8.0);
