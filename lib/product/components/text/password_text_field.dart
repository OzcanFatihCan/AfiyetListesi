import 'package:flutter/material.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    this.controller,
    this.isEditing = true,
  }) : super(key: key);

  final bool isEditing;
  final TextEditingController? controller;

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
      child: TextField(
        textInputAction: TextInputAction.next,
        controller: widget.controller,
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isSecure,
        decoration: _paswTextDecoration(hintText),
        enabled: widget.isEditing,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }

  InputDecoration _paswTextDecoration(String hintText) {
    return InputDecoration(
      border: const UnderlineInputBorder(),
      hintText: hintText,
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
  final double textFieldSize = 50;
  final double textFieldBorderSize = 3;
  //radius
  final fullRadius = const Radius.circular(30);
}
