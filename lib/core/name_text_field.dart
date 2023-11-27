import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key? key,
    this.controller,
    this.isEditing = true,
  }) : super(key: key);

  final bool isEditing;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PageItemSize.textFieldSize,
      child: TextField(
        controller: controller,
        enabled: isEditing,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: _nameDecoration(),
      ),
    );
  }

  InputDecoration _nameDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: PageColors.textFieldContentOnColor,
      prefixIconColor: PageColors.textFieldColor,
      prefixIcon: const Icon(Icons.person),
      hintText: "Ad Soyad",
      hintStyle: const TextStyle(color: PageColors.textFieldColor),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: PageColors.textFieldColor,
          width: PageItemSize.textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          PageItemSize.fullRadius(),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: PageColors.textFieldColor,
          width: PageItemSize.textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          PageItemSize.fullRadius(),
        ),
      ),
    );
  }
}
