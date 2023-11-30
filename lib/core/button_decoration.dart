import 'package:afiyetlistesi/core/item_size.dart';
import 'package:flutter/material.dart';

class ButtonDecorationWidget extends StatelessWidget with PageItemSize {
  ButtonDecorationWidget({
    Key? key,
    required this.onPressed,
    required this.buttonTitle,
  }) : super(key: key);

  final void Function() onPressed;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: PageItemSize.pagePaddingx,
        child: Text(
          buttonTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
