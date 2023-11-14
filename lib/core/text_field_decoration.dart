import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

InputDecoration privTextFieldDecoration() {
  return InputDecoration(
    prefixIconColor: PageColors.blackColor,
    prefixIcon: const Icon(Icons.search_rounded),
    hintText: ProjectWords.searchHint,
    hintStyle: TextStyle(color: PageColors.textFieldColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: PageColors.textFieldColor),
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: PageColors.textFieldColor),
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
    ),
  );
}
