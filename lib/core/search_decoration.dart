import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PageItemSize.textFieldSize,
      child: TextField(
        decoration: InputDecoration(
          prefixIconColor: PageColors.blackColor,
          prefixIcon: const Icon(Icons.search_rounded),
          hintText: ProjectWords.searchHint,
          hintStyle: TextStyle(color: PageColors.textFieldColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: PageColors.textFieldColor,
              width: PageItemSize.textFieldBorderSize,
            ),
            borderRadius: BorderRadius.all(
              PageItemSize.fullRadius(),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: PageColors.textFieldColor),
            borderRadius: BorderRadius.all(
              PageItemSize.fullRadius(),
            ),
          ),
        ),
      ),
    );
  }
}
