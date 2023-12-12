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
        elevation: elevation,
      ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: pagePadding,
        child: Text(
          widget.buttonTitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            shadows: [
              Shadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                offset: buttonOffset,
                blurRadius: blur,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

mixin _pageSize {
  final pagePadding = const EdgeInsets.all(8.0);
  final double blur = 4;
  final Offset buttonOffset = const Offset(0, 2);
  final double elevation = 7;
}
