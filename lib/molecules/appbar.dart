import 'package:flutter/material.dart';

import '../atoms/icon.dart';
import '../foundation/color_foundation.dart';

class Appbar extends StatelessWidget {
  final bool openMenu;
  final VoidCallback? onTapSearch;
  final VoidCallback? onTapCart;
  const Appbar(
      {this.openMenu = false, this.onTapCart, this.onTapSearch, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 10,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TweenAnimationBuilder<Color?>(
            duration: const Duration(milliseconds: 320),
            tween: ColorTween(
              begin: openMenu ? backgroundColor : primaryColor,
              end: openMenu ? primaryColor : backgroundColor,
            ),
            builder: (context, color, child) {
              return GestureDetector(
                onTap: onTapSearch,
                child: AppIcon(
                  sizeContainer: 60,
                  iconData: Icons.search,
                  color: openMenu ? backgroundColor : textColorPrimary,
                  size: 35,
                  backgroundColor: color ?? Colors.white,
                ),
              );
            },
          ),
          TweenAnimationBuilder<Color?>(
            duration: const Duration(milliseconds: 320),
            tween: ColorTween(
              begin: openMenu ? backgroundColor : primaryColor,
              end: openMenu ? primaryColor : backgroundColor,
            ),
            builder: (context, color, child) {
              return AppIcon(
                sizeContainer: 60,
                iconData: Icons.all_inclusive_rounded,
                color: openMenu ? backgroundColor : textColorPrimary,
                size: 40,
                backgroundColor: color ?? Colors.white,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                TweenAnimationBuilder<Color?>(
                  duration: const Duration(milliseconds: 320),
                  tween: ColorTween(
                    begin: openMenu ? backgroundColor : primaryColor,
                    end: openMenu ? primaryColor : backgroundColor,
                  ),
                  builder: (context, color, child) {
                    return GestureDetector(
                      onTap: onTapCart,
                      child: AppIcon(
                        sizeContainer: 60,
                        iconData: Icons.shopping_cart_outlined,
                        color: openMenu ? backgroundColor : textColorPrimary,
                        size: 35,
                        backgroundColor: color ?? Colors.white,
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 14,
                    width: 14,
                    decoration: const BoxDecoration(
                        color: Colors.transparent, shape: BoxShape.circle),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
