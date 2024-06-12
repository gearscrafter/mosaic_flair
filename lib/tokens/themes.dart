import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData theme = ThemeData(
  primaryColor: primary,
  colorScheme: const ColorScheme.light(
    primary: primary,
    secondary: secondary,
    surface: surface,
    error: error,
    onPrimary: onPrimary,
    onSecondary: onSecondary,
    onSurface: onSurface,
    onError: onError,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: onBackground),
    bodyLarge: TextStyle(fontSize: 16.0, color: onSurface),
  ),
);
