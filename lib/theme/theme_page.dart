import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemePage {
  final _themeColor = _ThemeColors();
  late ThemeData theme;

  ThemePage() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: _themeColor.deactivedScafooldColor,
        elevation: PageItemSize.elevationValueOff,
        foregroundColor: _themeColor.blackColor,
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            headlineMedium: TextStyle(
              fontWeight: PageFont.headFont,
              color: _themeColor.blackColor,
            ),
          ),
    );
  }
}

class _ThemeColors {
  final Color blackColor = Colors.black;
  final Color activeButtonColor = Colors.red;
  final Color activeButtonColor2 = Colors.white;
  final Color deactivedButtonColor = Colors.transparent;
  final Color activeButtonForeColor = Colors.white;
  final Color deactiveButtonForeColor = Colors.grey;
  final Color mainPageColor = const Color.fromARGB(255, 244, 225, 231);
  final Color textFieldColor = Colors.red;
  final Color textFieldContentOnColor = Colors.white;
  final Color textFieldContentOffColor = Colors.transparent;
  final Color cardColor = Colors.white;
  final Color cardColor2 = Colors.red;
  final Color deactivedScafooldColor = Colors.transparent;
  final Color activeIconColor = Colors.red;
  final deactiveIconColor = Colors.grey;
  final profilTextColor = Colors.red;
  final subtitleColor = Colors.grey;
  final backButtonColor = const Color.fromARGB(121, 160, 158, 158);
}
