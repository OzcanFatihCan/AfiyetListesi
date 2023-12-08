import 'package:flutter/material.dart';

class ButtonDecorationWidget extends StatefulWidget {
  const ButtonDecorationWidget({
    Key? key,
    required this.onPressed,
    required this.buttonTitle,
  }) : super(key: key);

  final Function() onPressed;
  final String buttonTitle;

  @override
  State<ButtonDecorationWidget> createState() => _ButtonDecorationWidgetState();
}

class _ButtonDecorationWidgetState extends State<ButtonDecorationWidget>
    with _pageSize {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: pagePadding,
        child: Text(
          widget.buttonTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

mixin _pageSize {
  final pagePadding = const EdgeInsets.all(8.0);
}
