import 'package:flutter/material.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({
    Key? key,
    this.controller,
    this.isEditing = true,
  }) : super(key: key);

  final bool isEditing;
  final TextEditingController? controller;

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> with _pageSize {
  @override
  Widget build(BuildContext context) {
    const hintText = "Ad Soyad";
    return SizedBox(
      height: textFieldSize,
      child: TextField(
        controller: widget.controller,
        enabled: widget.isEditing,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: _nameDecoration(hintText),
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }

  InputDecoration _nameDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).colorScheme.secondary,
      prefixIconColor: Theme.of(context).colorScheme.onPrimary,
      prefixIcon: const Icon(Icons.person),
      hintText: hintText,
      hintStyle: AppTheme().customTextTheme().titleMedium,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
          width: textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          fullRadius,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
          width: textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          fullRadius,
        ),
      ),
    );
  }
}

mixin _pageSize {
  //obj
  final double textFieldSize = 50;
  final double textFieldBorderSize = 3;
  //radius
  final fullRadius = const Radius.circular(30);
}
