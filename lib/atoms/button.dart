import 'package:flutter/material.dart';
import '../foundation/dimension_foundation.dart';
import '../foundation/color_foundation.dart';
import 'icon.dart';

/// `AppButton` es un widget de botón personalizado que puede incluir animaciones y configuraciones personalizadas.
///
/// ### Atributos:
/// - `label`: El texto que se muestra en el botón.
/// - `onPressed`: Callback que se ejecuta cuando se presiona el botón.
/// - `labelColor`: El color del texto del botón.
/// - `backColor`: El color de fondo del botón.
/// - `hasIconAnimation`: Indica si el botón debe tener una animación de icono.
/// - `width`: La anchura del botón.
/// - `iconAnimationController`: Controlador para la animación del icono.

class AppButton extends StatefulWidget {
  /// El texto que se muestra en el botón.
  final String label;

  /// Callback que se ejecuta cuando se presiona el botón.
  final VoidCallback? onPressed;

  /// El color del texto del botón.
  final Color? labelColor;

  /// El color de fondo del botón.
  final Color? backColor;

  /// Indica si el botón debe tener una animación de icono.
  final bool hasIconAnimation;

  /// La anchura del botón.
  final double? width;

  /// Controlador para la animación del icono.
  final AnimationController? iconAnimationController;

  /// Constructor para crear una instancia de `AppButton`.
  const AppButton({
    this.labelColor = Colors.black,
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

    /// Controlador de animación para el escalado del botón.
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
                padding: EdgeInsets.all(paddingMediumDimension),
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
                      style: TextStyle(
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
                                size: paddingLargeDimension,
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
