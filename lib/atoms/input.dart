import 'package:flutter/material.dart';

import '../foundation/color_foundation.dart';

class AppInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Color? colorInput;

  const AppInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.colorInput = textColorPrimary,
    this.obscureText = false,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isObscured,
      decoration: InputDecoration(
        fillColor: widget.colorInput,
        hintText: widget.hintText,
        iconColor: widget.colorInput,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                ),
                color: widget.colorInput,
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.colorInput ?? Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.colorInput ?? Colors.white),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.colorInput ?? Colors.white),
        ),
        hintStyle: TextStyle(color: widget.colorInput),
      ),
      cursorColor: widget.colorInput,
      style: TextStyle(color: widget.colorInput),
    );
  }
}
