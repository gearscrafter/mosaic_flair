import 'package:flutter/material.dart';
import '../foundation/dimension_foundation.dart';
import '../foundation/color_foundation.dart';
import 'icon.dart';

class AppButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? labelColor;
  final Color? backColor;
  final bool hasIconAnimation;
  final double? width;
  final AnimationController? iconAnimationController;

  const AppButton({
    this.labelColor = textColorPrimary,
    this.backColor,
    super.key,
    this.width,
    this.hasIconAnimation = false,
    required this.label,
    this.onPressed,
    this.iconAnimationController,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _iconAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.reverse) {
          Future.delayed(const Duration(milliseconds: 200), () {
            widget.onPressed!();
          });
        } else if (status == AnimationStatus.dismissed) {
          setState(() {
            _isAnimating = false;
          });
        }
      });

    _animation = Tween<double>(begin: 1, end: 1.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _iconAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: widget.iconAnimationController ??
            AnimationController(
              duration: const Duration(milliseconds: 600),
              vsync: this,
            ),
        curve: Curves.easeInOut,
      ),
    );

    widget.iconAnimationController?.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.iconAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: widget.width ?? (size.width - 50),
          child: Transform.scale(
            scale: _animation.value,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.backColor,
                foregroundColor: widget.labelColor,
                disabledBackgroundColor: backgroundColor,
                elevation: 2,
                padding: const EdgeInsets.all(paddingMediumDimension),
              ),
              onPressed: widget.onPressed != null
                  ? () {
                      if (!_isAnimating) {
                        setState(() {
                          _isAnimating = true;
                        });
                        _controller.forward();
                      }
                    }
                  : null,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: widget.hasIconAnimation
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      widget.label,
                      style: const TextStyle(
                          fontSize: fontSizeMediumDimension,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  widget.hasIconAnimation
                      ? AnimatedBuilder(
                          animation: _iconAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(_iconAnimation.value * -8, 0),
                              child: AppIcon(
                                backgroundColor:
                                    widget.backColor ?? backgroundColor,
                                iconData: Icons.arrow_forward_sharp,
                                color: textColorPrimary,
                              ),
                            );
                          })
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
