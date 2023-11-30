import 'package:flutter/material.dart';

class ButtonDecorationWidget extends StatelessWidget with _pageSize {
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
        padding: pagePadding,
        child: Text(
          buttonTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

mixin _pageSize {
  final pagePadding = const EdgeInsets.all(8.0);
}
