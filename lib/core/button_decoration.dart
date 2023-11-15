import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:flutter/material.dart';

class ButtonDecorationWidget extends StatelessWidget
    with PageColors, PageItemSize {
  ButtonDecorationWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isSelected = true,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //side: const BorderSide(color: _FoodPageColors.headColor),
        shape: const StadiumBorder(),
        elevation: 0,
        backgroundColor: isSelected
            ? PageColors.activeButtonColor
            : PageColors.deactivedButtonColor,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: PageItemSize.pagePaddingx,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isSelected
                  ? PageColors.activeButtonForeColor
                  : PageColors.deactiveButtonForeColor,
              fontWeight: FoodPageFont.buttonFont),
        ),
      ),
    );
  }
}
