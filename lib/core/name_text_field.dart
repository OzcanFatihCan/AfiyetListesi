import 'package:flutter/material.dart';
import 'package:afiyetlistesi/core/item_size.dart';
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

class _NameTextFieldState extends State<NameTextField> {
  @override
  Widget build(BuildContext context) {
    const hintText = "Ad Soyad";
    return SizedBox(
      height: PageItemSize.textFieldSize,
      child: TextField(
        controller: widget.controller,
        enabled: widget.isEditing,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: _nameDecoration(hintText),
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
          width: PageItemSize.textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          PageItemSize.fullRadius(),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
          width: PageItemSize.textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          PageItemSize.fullRadius(),
        ),
      ),
    );
  }
}
