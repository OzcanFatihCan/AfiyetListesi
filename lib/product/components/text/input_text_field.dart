import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    Key? key,
    this.controller,
    this.validator,
    this.isEditing = true,
    this.onChanged,
    required this.prefixIcon,
    required this.hintText,
    this.autofillHints,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool isEditing;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> with _pageSize {
  final int _animatedDuration = 2;
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: textFieldSize,
      child: TextFormField(
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        autofillHints: widget.autofillHints,
        keyboardType: widget.keyboardType,
        decoration: _textDecoration(),
        obscureText: widget.hintText == "Parola" ? _isSecure : false,
        enabled: widget.isEditing,
        style: Theme.of(context).textTheme.labelSmall,
        validator: widget.validator,
        onChanged: widget.onChanged,
      ),
    );
  }

  InputDecoration _textDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(fullRadius),
      ),
      errorStyle: TextStyle(
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            offset: textOffset,
            blurRadius: blur,
          ),
        ],
      ),
      hintText: widget.hintText,
      contentPadding: contentPadding,
      filled: true,
      fillColor: Theme.of(context).colorScheme.secondary,
      prefixIconColor: Theme.of(context).colorScheme.onPrimary,
      prefixIcon: widget.prefixIcon,
      suffixIcon:
          widget.hintText == "Parola" ? _onVisiblityIcon() : const SizedBox(),
      hintStyle: AppTheme().customTextTheme().titleMedium,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
          width: textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          fullRadius,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
          width: textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          fullRadius,
        ),
      ),
    );
  }

  IconButton _onVisiblityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      color: Theme.of(context).colorScheme.onPrimary,
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        crossFadeState:
            _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(seconds: _animatedDuration),
      ),
    );
  }
}

mixin _pageSize {
  //obj
  final double textFieldSize = 77;
  final double textFieldBorderSize = 3;
  final double blur = 2.0;
  final Offset textOffset = const Offset(0, 1);
  //radius
  final fullRadius = const Radius.circular(30);
  //padding
  final EdgeInsets contentPadding = const EdgeInsets.all(10);
}
