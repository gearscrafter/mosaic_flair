import 'dart:math';
import 'package:flutter/material.dart';
import 'icon.dart';
import '../foundation/color_foundation.dart';

class ProcessButton extends StatefulWidget {
  final VoidCallback? leftOnTap;
  final VoidCallback? centerOnTap;
  final VoidCallback? rightOnTap;
  final IconData? iconData;
  final List<String>? steps;
  final ValueChanged<int>? onTextChange;

  const ProcessButton({
    this.iconData,
    this.leftOnTap,
    this.centerOnTap,
    this.rightOnTap,
    this.steps,
    this.onTextChange,
    super.key,
  });

  @override
  State<ProcessButton> createState() => _ProcessButtonState();
}

class _ProcessButtonState extends State<ProcessButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  double spaceButton = -160.0;
  late int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = 0;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Navigator.of(context).pop();
      }
    });
    _controller.forward();
    widget.onTextChange?.call(_currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextText() {
    setState(() {
      if (_currentIndex < (widget.steps ?? []).length - 1) {
        _currentIndex++;
        widget.onTextChange?.call(_currentIndex);
      } else {
        if (_controller.isCompleted) {
          _controller.reverse();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_animation.value * spaceButton, 0),
                  child: Transform.rotate(
                    angle: -pi * 2 * _animation.value,
                    child: const AppIcon(
                      iconData: Icons.arrow_back,
                      color: backgroundColor,
                      backgroundColor: primaryColor,
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(-_animation.value * spaceButton, 0),
                  child: Transform.rotate(
                    angle: pi * (2) * _animation.value,
                    child: AppIcon(
                      iconData: widget.iconData ?? Icons.bookmark_outline_sharp,
                      color: backgroundColor,
                      backgroundColor: primaryColor,
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: primaryColor,
                  ),
                  height: 40,
                  width: (150.0 * _animation.value) + 40.0,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: Opacity(
                      opacity: _animation.value,
                      child: Text(
                        widget.steps?[_currentIndex] ?? '',
                        key: ValueKey<String>(
                            widget.steps?[_currentIndex] ?? ''),
                        style: const TextStyle(
                          color: backgroundColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? size.width * 0.025
                          : size.width * 0.275,
                ),
                child: GestureDetector(
                  onTap: () {
                    if (_controller.isCompleted && widget.leftOnTap != null) {
                      widget.leftOnTap!();
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  if (_controller.isCompleted &&
                      widget.centerOnTap != null &&
                      (widget.steps ?? []).isNotEmpty) {
                    _nextText();
                    widget.centerOnTap!();
                  }
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? size.width * 0.025
                          : size.width * 0.275,
                ),
                child: GestureDetector(
                  onTap: () {
                    if (_controller.isCompleted && widget.rightOnTap != null) {
                      widget.rightOnTap!();
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
