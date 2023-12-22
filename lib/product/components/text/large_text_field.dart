import 'package:flutter/material.dart';

class LargeTextField extends StatelessWidget with _pageSize {
  LargeTextField({
    super.key,
    this.textController,
    this.maxLines,
    this.maxLength,
    required this.hintText,
  });

  final TextEditingController? textController;
  final int? maxLines;
  final int? maxLength;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      controller: textController,
      maxLines: maxLines ?? defaultLines,
      maxLength: maxLength ?? defaultLenght,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: halfRadius,
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSecondary,
            width: textFieldBorderSize,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: halfRadius,
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
            width: textFieldBorderSize,
          ),
        ),
      ),
    );
  }
}

mixin _pageSize {
  final int defaultLines = 5;
  final int defaultLenght = 500;
  //obj
  final double textFieldBorderSize = 3;
  //radius
  final halfRadius = BorderRadius.circular(15);
}
