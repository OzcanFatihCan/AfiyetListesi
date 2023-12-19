import 'package:flutter/material.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    this.controller,
    this.validator,
    this.isEditing = true,
    this.onChanged,
  }) : super(key: key);

  final bool isEditing;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> with _pageSize {
  final int _animatedDuration = 2;
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    const hintText = "Parola";
    return SizedBox(
      height: textFieldSize,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: widget.controller,
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isSecure,
        validator: widget.validator,
        decoration: _paswTextDecoration(hintText),
        enabled: widget.isEditing,
        style: Theme.of(context).textTheme.labelSmall,
        onChanged: widget.onChanged,
      ),
    );
  }

  InputDecoration _paswTextDecoration(String hintText) {
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
      hintText: hintText,
      contentPadding: contentPadding,
      suffixIcon: _onVisiblityIcon(),
      filled: true,
      fillColor: Theme.of(context).colorScheme.secondary,
      prefixIconColor: Theme.of(context).colorScheme.onPrimary,
      prefixIcon: const Icon(Icons.password_rounded),
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
