import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:flutter/material.dart';

class InputBarWidget extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final Color fillColor;
  final bool isPasw;

  const InputBarWidget({
    Key? key,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.fillColor = PageColors.textFieldContentOffColor,
    this.isPasw = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PageItemSize.textFieldSize,
      child: TextField(
        obscureText: isPasw,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          prefixIconColor: PageColors.textFieldColor,
          prefixIcon: Icon(icon),
          hintText: hint,
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
        ),
      ),
    );
  }
}
