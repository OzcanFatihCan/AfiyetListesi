import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    const hintText = "Yemek ara";
    return SizedBox(
      height: PageItemSize.textFieldSize,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: _inputDecoration(hintText, context),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText, BuildContext context) {
    return InputDecoration(
      prefixIconColor: PageColors.textFieldColor,
      prefixIcon: const Icon(Icons.search_rounded),
      hintText: hintText,
      hintStyle: AppTheme().customTextTheme().labelLarge,
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
