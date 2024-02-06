import 'package:flutter/material.dart';

class LargeTextField extends StatelessWidget with _pageSize {
  LargeTextField({
    super.key,
    this.textController,
    this.maxLines,
    this.maxLength,
    required this.hintText,
    this.isEditing = true,
  });

  final TextEditingController? textController;
  final int? maxLines;
  final int? maxLength;
  final String? hintText;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.labelLarge,
      controller: textController,
      maxLines: maxLines ?? defaultLines,
      maxLength: maxLength ?? defaultLenght,
      enabled: isEditing,
      textInputAction: TextInputAction.none,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: halfRadius,
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
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
        disabledBorder: OutlineInputBorder(
          borderRadius: halfRadius,
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
            width: textFieldBorderSize,
          ),
        ),
        counterStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
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
