import 'package:flutter/material.dart';

class ButtonDecorationWidget extends StatefulWidget {
  const ButtonDecorationWidget({
    Key? key,
    required this.onPressed,
    required this.buttonTitle,
  }) : super(key: key);

  final Future<void> Function() onPressed;
  final String buttonTitle;

  @override
  State<ButtonDecorationWidget> createState() => _ButtonDecorationWidgetState();
}

class _ButtonDecorationWidgetState extends State<ButtonDecorationWidget>
    with _pageSize {
  bool _isLoading = false;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: () async {
        if (_isLoading) return;
        _changeLoading();
        await widget.onPressed.call();
        _changeLoading();
      },
      child: Padding(
        padding: pagePadding,
        child: _isLoading
            ? CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              )
            : Text(
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
