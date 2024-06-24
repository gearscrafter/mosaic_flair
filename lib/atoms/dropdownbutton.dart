import 'package:flutter/material.dart';

class AppDropdownButton extends StatefulWidget {
  final List<Widget>? items;
  final Widget? hint;
  final ValueChanged<Widget?>? onItemSelected;

  const AppDropdownButton({
    required this.hint,
    super.key,
    this.items,
    this.onItemSelected,
  });

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  Widget? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Widget>(
      hint: widget.hint,
      value: _selectedItem,
      onChanged: (Widget? newValue) {
        setState(() {
          _selectedItem = newValue;
          widget.onItemSelected?.call(_selectedItem);
        });
      },
      items: widget.items?.map<DropdownMenuItem<Widget>>((Widget? value) {
        return DropdownMenuItem<Widget>(
          value: value,
          child: value!,
        );
      }).toList(),
    );
  }
}
