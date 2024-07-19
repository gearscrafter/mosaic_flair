import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../foundation/dimension_foundation.dart';
import 'icon.dart';
import '../foundation/color_foundation.dart';

/// `ProcessButton` es un widget personalizado que muestra un botón con múltiples pasos
/// y animaciones que representan diferentes estados del proceso.
///
/// ### Atributos:
/// - `leftOnTap`: Callback que se ejecuta cuando se presiona el área izquierda del botón.
/// - `centerOnTap`: Callback que se ejecuta cuando se presiona el área central del botón.
/// - `rightOnTap`: Callback que se ejecuta cuando se presiona el área derecha del botón.
/// - `iconData`: Icono que se muestra en el área central del botón.
/// - `steps`: Lista de textos que representan los pasos del proceso.
/// - `onTextChange`: Callback que se ejecuta cuando cambia el texto del paso actual.

class ProcessButton extends StatefulWidget {
  /// Callback que se ejecuta cuando se presiona el área izquierda del botón.
  final VoidCallback? leftOnTap;

  /// Callback que se ejecuta cuando se presiona el área central del botón.
  final VoidCallback? centerOnTap;

  /// Callback que se ejecuta cuando se presiona el área derecha del botón.
  final VoidCallback? rightOnTap;

  /// Icono que se muestra en el área central del botón.
  final IconData? iconData;

  /// Lista de textos que representan los pasos del proceso.
  final List<String>? steps;

  /// Callback que se ejecuta cuando cambia el texto del paso actual.
  final ValueChanged<int>? onTextChange;

  /// Constructor para crear una instancia de `ProcessButton`.
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

  /// Espacio de desplazamiento para la animación de los botones laterales.
  double spaceButton = -160.0;
  bool readSteps = false;

  /// Índice del paso actual.
  late int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = 0;

    /// Inicialización del controlador de animación.
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    /// Inicialización de la animación.
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    /// Listener para la animación.
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Navigator.of(context).pop();
      }
    });

    /// Inicio de la animación.
    _controller.forward();

    /// Callback para el cambio de texto inicial.
    widget.onTextChange?.call(_currentIndex);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Método para cambiar al siguiente texto en la lista de pasos.
  void _nextText() {
    setState(() {
      if (_currentIndex < (widget.steps ?? []).length - 1) {
        _currentIndex++;
        readSteps = false;
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
            /// Animación del botón izquierdo.
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_animation.value * spaceButton, 0),
                  child: Transform.rotate(
                    angle: -pi * 2 * _animation.value,
                    child: AppIcon(
                      iconData: Icons.arrow_back,
                      color: backgroundColor,
                      backgroundColor: primaryColor,
                      size: paddingLargeDimension,
                    ),
                  ),
                );
              },
            ),

            /// Animación del botón central.
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(-_animation.value * spaceButton, 0),
                  child: Transform.rotate(
                    angle: pi * 2 * _animation.value,
                    child: AppIcon(
                      iconData: widget.iconData ?? Icons.bookmark_outline_sharp,
                      color: backgroundColor,
                      backgroundColor: primaryColor,
                      size: paddingLargeDimension,
                    ),
                  ),
                );
              },
            ),

            /// Contenedor para el texto del paso actual.
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                        style: TextStyle(
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

            /// Área sensible al clic para el botón izquierdo.
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? size.width * 0.025
                          : size.width * 0.275,
                ),
                child: Semantics(
                  label: 'Botón izquierdo',
                  hint: 'Va a una pantalla hacia atrás',
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
            ),

            /// Área sensible al clic para el botón central.
            Align(
              alignment: Alignment.center,
              child: Semantics(
                label: 'Botón central',
                hint: widget.steps?[_currentIndex],
                tooltip: widget.steps?[_currentIndex],
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
            ),

            /// Área sensible al clic para el botón derecho.
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? size.width * 0.025
                          : size.width * 0.275,
                ),
                child: Semantics(
                  label: 'Botón derecho',
                  hint: 'Realiza una acción',
                  child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted &&
                          widget.rightOnTap != null) {
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
            ),
          ],
        );
      },
    );
  }
}
