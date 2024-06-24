import 'package:flutter/material.dart';

import '../foundation/dimension_foundation.dart';
import '../foundation/color_foundation.dart';
import '../foundation/icon_foundation.dart';

class SearchBarM extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onSearch;
  final String hintText;

  const SearchBarM({
    super.key,
    required this.controller,
    this.onSearch,
    this.hintText = 'Search...',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onSearch,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(
          searchIcon,
          size: 35,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusDimensions),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: backgroundColor,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: paddingMediumDimension,
            vertical: paddingMediumDimension),
      ),
    );
  }
}
