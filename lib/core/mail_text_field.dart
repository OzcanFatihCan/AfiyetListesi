import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:flutter/material.dart';

class MailTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isEditing;
  const MailTextField({Key? key, this.controller, this.isEditing = true})
      : super(key: key);

  @override
  State<MailTextField> createState() => _MailTextFieldState();
}

class _MailTextFieldState extends State<MailTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PageItemSize.textFieldSize,
      child: TextField(
        controller: widget.controller,
        autofillHints: const [AutofillHints.email],
        keyboardType: TextInputType.emailAddress,
        decoration: _mailTextDecoration(),
        enabled: widget.isEditing,
      ),
    );
  }

  InputDecoration _mailTextDecoration() {
    return InputDecoration(
      border: const UnderlineInputBorder(),
      hintText: 'Email',
      filled: true,
      fillColor: PageColors.textFieldContentOnColor,
      prefixIconColor: PageColors.textFieldColor,
      prefixIcon: const Icon(Icons.mail_rounded),
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
}
