// lib/foundation/icon_foundation.dart
import '../core/app_config.dart';
import 'package:flutter/material.dart';

final appConfig = AppConfig();

final IconData home = appConfig.getIcon('home', Icons.home);
final IconData search = appConfig.getIcon('search', Icons.search);
final IconData cart = appConfig.getIcon('cart', Icons.shopping_cart);
final IconData profile = appConfig.getIcon('profile', Icons.person);
final IconData support = appConfig.getIcon('support', Icons.help);
