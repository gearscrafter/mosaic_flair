import 'package:flutter/material.dart';
import '../atoms/icon.dart';
import '../atoms/text.dart';
import '../foundation/color_foundation.dart';
import '../foundation/dimension_foundation.dart';

class Menu extends StatefulWidget {
  final bool isScrolling;
  final bool isHome;
  final VoidCallback? onTapHome;
  final VoidCallback? onTapProducts;
  final VoidCallback? onTapSupport;
  final VoidCallback? onTapContact;
  final Function(bool openMenu) hasMenu;

  const Menu({
    super.key,
    this.isHome = false,
    this.onTapHome,
    this.onTapProducts,
    this.onTapSupport,
    this.onTapContact,
    required this.hasMenu,
    this.isScrolling = false,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  bool _isShowOverlay = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 0,
          bottom: 60,
          right: 0,
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value * 160,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                        color: primaryColor, shape: BoxShape.circle),
                  ),
                );
              }),
        ),
        AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _animation.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                          text: '*',
                          textColor: backgroundColor,
                        ),
                        const SizedBox(
                          width: paddingMediumDimension,
                        ),
                        AppText(
                          text: 'Menu',
                          textColor: backgroundColor.withOpacity(0.5),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const AppText(
                          text: '*',
                          textColor: backgroundColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: paddingLargeDimension,
                    ),
                    const SizedBox(
                      height: paddingLargeDimension,
                    ),
                    widget.isHome
                        ? GestureDetector(
                            onTap: widget.onTapHome,
                            child: const AppText(
                              text: 'Home',
                              textColor: backgroundColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: widget.onTapProducts,
                            child: const AppText(
                              text: 'Products',
                              textColor: backgroundColor,
                            ),
                          ),
                    const SizedBox(
                      height: paddingLargeDimension,
                    ),
                    GestureDetector(
                      onTap: widget.onTapSupport,
                      child: const AppText(
                        text: 'Support',
                        textColor: backgroundColor,
                      ),
                    ),
                    const SizedBox(
                      height: paddingLargeDimension,
                    ),
                    GestureDetector(
                      onTap: widget.onTapContact,
                      child: const AppText(
                        text: 'Contact',
                        textColor: backgroundColor,
                      ),
                    ),
                  ],
                ),
              );
            }),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: size.width * 0.5 - 20,
          bottom: widget.isScrolling ? -80 : 60,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: widget.isScrolling ? 0 : 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isShowOverlay = !_isShowOverlay;
                  widget.hasMenu(_isShowOverlay);
                  if (_isShowOverlay) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                });
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: _isShowOverlay ? backgroundColor : primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: AppIcon(
                    iconData: _isShowOverlay ? Icons.close : Icons.menu,
                    color: _isShowOverlay ? primaryColor : backgroundColor,
                    backgroundColor:
                        _isShowOverlay ? backgroundColor : primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
