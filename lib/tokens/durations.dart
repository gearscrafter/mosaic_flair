// lib/foundation/duration_foundation.dart
import '../core/app_config.dart';

final appConfig = AppConfig();

final Duration shortDurationToken =
    appConfig.getDuration('shortDuration', const Duration(milliseconds: 200));
final Duration mediumDurationToken =
    appConfig.getDuration('mediumDuration', const Duration(milliseconds: 400));
final Duration longDurationToken =
    appConfig.getDuration('longDuration', const Duration(milliseconds: 600));
