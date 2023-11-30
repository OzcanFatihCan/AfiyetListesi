import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MailTextField extends StatefulWidget {
  const MailTextField({
    Key? key,
    this.controller,
    this.isEditing = true,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool isEditing;

  @override
  State<MailTextField> createState() => _MailTextFieldState();
}

class _MailTextFieldState extends State<MailTextField> with _pageSize {
  @override
  Widget build(BuildContext context) {
    const hintText = "Email";
    return SizedBox(
      height: textFieldSize,
      child: TextField(
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        autofillHints: const [AutofillHints.email],
        keyboardType: TextInputType.emailAddress,
        decoration: _mailTextDecoration(hintText),
        enabled: widget.isEditing,
      ),
    );
  }

  InputDecoration _mailTextDecoration(String hintText) {
    return InputDecoration(
      border: const UnderlineInputBorder(),
      hintText: hintText,
      filled: true,
      fillColor: Theme.of(context).colorScheme.secondary,
      prefixIconColor: Theme.of(context).colorScheme.onPrimary,
      prefixIcon: const Icon(Icons.mail_rounded),
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
}

mixin _pageSize {
  //obj
  final double textFieldSize = 50;
  final double textFieldBorderSize = 3;
  //radius
  final fullRadius = const Radius.circular(30);
}
