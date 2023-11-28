import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:flutter/material.dart';

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

class _PasswordTextFieldState extends State<PasswordTextField> {
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
      height: PageItemSize.textFieldSize,
      child: TextField(
        textInputAction: TextInputAction.next,
        controller: widget.controller,
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isSecure,
        decoration: _paswTextDecoration(hintText),
        enabled: widget.isEditing,
      ),
    );
  }

  InputDecoration _paswTextDecoration(String hintText) {
    return InputDecoration(
      border: const UnderlineInputBorder(),
      hintText: hintText,
      suffixIcon: _onVisiblityIcon(),
      filled: true,
      fillColor: PageColors.textFieldContentOnColor,
      prefixIconColor: PageColors.textFieldColor,
      prefixIcon: const Icon(Icons.password_rounded),
      hintStyle: const TextStyle(color: PageColors.textFieldColor),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: PageColors.textFieldColor,
          width: PageItemSize.textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          PageItemSize.fullRadius(),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: PageColors.textFieldColor,
          width: PageItemSize.textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          PageItemSize.fullRadius(),
        ),
      ),
    );
  }

  IconButton _onVisiblityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      color: PageColors.activeButtonColor,
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
