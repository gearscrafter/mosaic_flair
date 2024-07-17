import 'package:flutter/rendering.dart';

import '../core/app_config.dart';

final appConfig = AppConfig();

final Radius smallRadiusToken =
    Radius.circular(appConfig.getDouble('smallRadius', 4.0));
final Radius mediumRadiusToken =
    Radius.circular(appConfig.getDouble('mediumRadius', 8.0));
final Radius largeRadiusToken =
    Radius.circular(appConfig.getDouble('largeRadius', 16.0));
