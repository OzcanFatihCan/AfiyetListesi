import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MailTextField extends StatefulWidget {
  const MailTextField({
    Key? key,
    this.controller,
    this.validator,
    this.isEditing = true,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool isEditing;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  @override
  State<MailTextField> createState() => _MailTextFieldState();
}

class _MailTextFieldState extends State<MailTextField> with _pageSize {
  @override
  Widget build(BuildContext context) {
    const hintText = "Email";
    return SizedBox(
      height: textFieldSize,
      child: TextFormField(
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        autofillHints: const [AutofillHints.email],
        keyboardType: TextInputType.emailAddress,
        decoration: _mailTextDecoration(hintText),
        enabled: widget.isEditing,
        style: Theme.of(context).textTheme.labelSmall,
        validator: widget.validator,
        onChanged: widget.onChanged,
      ),
    );
  }

  InputDecoration _mailTextDecoration(String hintText) {
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
  final double textFieldSize = 77;
  final double textFieldBorderSize = 3;
  final double blur = 2.0;
  final Offset textOffset = const Offset(0, 1);
  //radius
  final fullRadius = const Radius.circular(30);
  //padding
  final EdgeInsets contentPadding = const EdgeInsets.all(10);
}
