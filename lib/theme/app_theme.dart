import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  final _themeColor = _ThemeColors();
  final _themeSize = _ThemeSizes();
  final _themeFont = _ThemeFonts();
  late ThemeData theme;

  AppTheme() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: _themeColor.deactivedScafooldColor,
        elevation: _themeSize.elevationValueOff,
        foregroundColor: _themeColor.blackColor,
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            headlineMedium: TextStyle(
              fontWeight: _themeFont.headFont,
              color: _themeColor.blackColor,
            ),
          ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            _themeSize.halfRadius(),
          ),
        ),
        color: _themeColor.cardColor,
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
  final Color deactiveIconColor = Colors.grey;
  final Color profilTextColor = Colors.red;
  final Color subtitleColor = Colors.grey;
  final Color backButtonColor = const Color.fromARGB(121, 160, 158, 158);
}

class _ThemeSizes {
  //obj
  final double textFieldSize = 50;
  final double textFieldBorderSize = 3;
  final int textLimitx = 35;
  final int textLimit2x = 50;
  final double spaceObjects = 20;
  final double spaceObjectsMin = 10;
  final double foodPhotoHeightSize = 130;
  final double foodPhotoWidthSize = 120;
  final double listPhotoHeightSize = 60;
  final double listPhotoWidthSize = 80;
  final double bottomNavHeight = 60;
  final double loginButtonPositionBot = 175;
  final double loginButtonSymetric = 15;
  final double alternativeLoginPositionBot = 5;
  final double firstInputBarPositionBot = 430;
  final double secondInputBarPositionBot = 360;
  final double thirdInputBarPositinBot = 290;
  final double inputBarSymetric = 15;
  final int drawerLines = 1;

//padding
  final EdgeInsets pagePaddingx = const EdgeInsets.all(8.0);
  final EdgeInsets pagePadding2x = const EdgeInsets.all(16.0);
  final EdgeInsets objectPaddingx = const EdgeInsets.all(8.0);
  final EdgeInsets objectPadding2x = const EdgeInsets.all(16.0);
  final EdgeInsets buttonPaddingx = const EdgeInsets.symmetric(horizontal: 15);
  final EdgeInsets cardPaddingx = const EdgeInsets.symmetric(horizontal: 5);
  final EdgeInsets listPadding2x = const EdgeInsets.symmetric(horizontal: 15);
  final EdgeInsets listPaddingx = const EdgeInsets.symmetric(horizontal: 10);

  final EdgeInsets bottomPadding = const EdgeInsets.only(
    bottom: 25,
    right: 20,
    left: 20,
  );
  final EdgeInsets imagePadding = const EdgeInsets.only(
    bottom: 16,
    right: 16,
    left: 16,
    top: 32,
  );

//radius
  Radius halfRadius() => const Radius.circular(15);
  Radius fullRadius() => const Radius.circular(30);
  BorderRadius foodDetailRadius() => const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      );

//elevation
  final double elevationValue = 8;
  final double elevationValueOff = 0;
}

class _ThemeFonts {
  final headFont = FontWeight.w500;
  final buttonFont = FontWeight.bold;
  final textFont = FontWeight.w800;
  final subtitleFont = FontWeight.w500;
}
