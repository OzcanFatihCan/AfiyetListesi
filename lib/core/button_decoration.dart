import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:flutter/material.dart';

class ButtonDecorationWidget extends StatelessWidget
    with PageColors, PageItemSize {
  final String buttonTitle;
  ButtonDecorationWidget({
    Key? key,
    required this.onPressed,
    required this.buttonTitle,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //side: const BorderSide(color: _FoodPageColors.headColor),
        shape: const StadiumBorder(),
        backgroundColor: PageColors.activeButtonColor,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: PageItemSize.pagePaddingx,
        child: Text(
          buttonTitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: PageColors.activeButtonForeColor,
              fontWeight: PageFont.buttonFont),
        ),
      ),
    );
  }
}
