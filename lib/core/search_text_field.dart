import 'package:flutter/material.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> with _pageSize {
  @override
  Widget build(BuildContext context) {
    const hintText = "Yemek ara";
    return SizedBox(
      height: textFieldSize,
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.text,
        decoration: _inputDecoration(hintText, context),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText, BuildContext context) {
    return InputDecoration(
      prefixIconColor: Theme.of(context).colorScheme.onPrimary,
      prefixIcon: const Icon(Icons.search_rounded),
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
