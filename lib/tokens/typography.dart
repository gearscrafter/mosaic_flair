import '../core/app_config.dart';
import 'package:flutter/material.dart';

final appConfig = AppConfig();

final TextStyle line1 = appConfig.getTextStyle(
    'line1', const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold));
final TextStyle text1 =
    appConfig.getTextStyle('text1', const TextStyle(fontSize: 16.0));
final TextStyle text2 =
    appConfig.getTextStyle('text2', const TextStyle(fontSize: 14.0));
