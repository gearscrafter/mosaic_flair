import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';
import 'text.dart';

class Support extends StatelessWidget {
  final String label;
  final String info;
  final IconData icon;
  const Support(
      {required this.icon, required this.label, required this.info, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: accentColor1,
          ),
          borderRadius:
              const BorderRadius.all(Radius.circular(borderRadiusDimensions))),
      child: ListTile(
        leading: Icon(icon),
        title: AppText(text: label),
        onTap: () {
          Clipboard.setData(ClipboardData(text: label));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: AppText(
                text: info,
                textColor: backgroundColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
