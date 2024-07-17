import '../core/app_config.dart';

final appConfig = AppConfig();

final double small = appConfig.getDouble('smallSpacing', 8.0);
final double medium = appConfig.getDouble('mediumSpacing', 16.0);
final double large = appConfig.getDouble('largeSpacing', 24.0);
