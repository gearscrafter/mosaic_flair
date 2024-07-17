import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  late final Map<String, dynamic> config;
  late final bool useJsonConfig;

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  Future<void> load(String path, {bool useJsonConfig = true}) async {
    this.useJsonConfig = useJsonConfig;
    if (useJsonConfig) {
      final jsonString = await rootBundle.loadString(path);
      config = json.decode(jsonString);
    } else {
      config = {};
    }
  }

  String getString(String key, String defaultValue) {
    return useJsonConfig
        ? (config[key] as String? ?? defaultValue)
        : defaultValue;
  }

  int getInt(String key, int defaultValue) {
    return useJsonConfig ? (config[key] as int? ?? defaultValue) : defaultValue;
  }

  double getDouble(String key, double defaultValue) {
    return useJsonConfig
        ? (config[key] as double? ?? defaultValue)
        : defaultValue;
  }

  Color getColor(String key, Color defaultValue) {
    if (useJsonConfig) {
      final colorString = config[key] as String?;
      if (colorString != null && colorString.startsWith('0x')) {
        return Color(int.parse(colorString));
      }
    }
    return defaultValue;
  }

  Duration getDuration(String key, Duration defaultValue) {
    return useJsonConfig
        ? Duration(
            milliseconds:
                config['durations'][key] ?? defaultValue.inMilliseconds)
        : defaultValue;
  }

  IconData getIcon(String key, IconData defaultValue) {
    return useJsonConfig
        ? IconData(config[key], fontFamily: 'MaterialIcons')
        : defaultValue;
  }

  Radius getRadius(String key, Radius defaultValue) {
    return useJsonConfig
        ? Radius.circular(config[key] as double? ?? defaultValue.x)
        : defaultValue;
  }

  TextStyle getTextStyle(String key, TextStyle defaultValue) {
    if (useJsonConfig) {
      final styleConfig = config[key] as Map<String, dynamic>? ?? {};
      return TextStyle(
        fontSize: styleConfig['fontSize']?.toDouble() ?? defaultValue.fontSize,
        fontWeight: FontWeight.values[
            styleConfig['fontWeight'] ?? defaultValue.fontWeight?.index ?? 0],
      );
    } else {
      return defaultValue;
    }
  }
}
