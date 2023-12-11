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
        backgroundColor: _themeColor.transparentColor,
        elevation: _themeSize.elevationValueOff,
        foregroundColor: _themeColor.blackColor,
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: _themeColor.blackColor,
        onPrimary: _themeColor.redColor,
        secondary: _themeColor.whiteColor,
        onSecondary: _themeColor.greyColor,
        error: _themeColor.redColor,
        onError: _themeColor.redColor2,
        background: _themeColor.mainColor,
        onBackground: _themeColor.lightGreyColor,
        surface: _themeColor.transparentColor,
        onSurface: _themeColor.millionGrey,
      ),
      textTheme: TextTheme(
        bodySmall: TextStyle(
          color: _themeColor.blackColor,
          fontWeight: _themeFont.w4Font,
          fontSize: _themeSize.fontSizeMin,
        ),
        bodyMedium: TextStyle(
          color: _themeColor.blackColor,
          fontWeight: _themeFont.w4Font,
          fontSize: _themeSize.fontSizeMin,
        ),
        //card subtitle
        bodyLarge: TextStyle(
          color: _themeColor.blackColor,
          fontWeight: _themeFont.w4Font,
          fontSize: _themeSize.fontSizeMin2,
        ),
        //input text
        labelSmall: TextStyle(
          color: _themeColor.blackColor,
          fontWeight: _themeFont.w5Font,
          fontSize: _themeSize.fontSizeMin2,
        ),
        //card header
        labelMedium: TextStyle(
          color: _themeColor.blackColor,
          fontWeight: _themeFont.w5Font,
          fontSize: _themeSize.fontSizeMin3,
        ),
        //contentbutton custom and main
        labelLarge: TextStyle(
          color: _themeColor.blackColor,
          fontWeight: _themeFont.w5Font,
          fontSize: _themeSize.fontSizeMid,
        ),
        //textbutton popular
        titleSmall: TextStyle(
          color: _themeColor.redColor,
          fontWeight: _themeFont.w6Font,
          fontSize: _themeSize.fontSizeMid,
        ),
        //normalbutton
        titleMedium: TextStyle(
          color: _themeColor.whiteColor,
          fontWeight: _themeFont.w6Font,
          fontSize: _themeSize.fontSizeMid2,
        ),
        titleLarge: TextStyle(
          color: _themeColor.blackColor,
          fontWeight: _themeFont.w6Font,
          fontSize: _themeSize.fontSizeMid3,
        ),
        //appbar
        headlineSmall: TextStyle(
          color: _themeColor.blackColor,
          fontWeight: _themeFont.w7Font,
          fontSize: _themeSize.fontSizeMax,
        ),
        //second header / food detail header
        headlineMedium: TextStyle(
          color: _themeColor.blackColor,
          fontWeight: _themeFont.w7Font,
          fontSize: _themeSize.fontSizeMax2,
        ),
        //first header
        headlineLarge: TextStyle(
          color: _themeColor.blackColor,
          fontWeight: _themeFont.w7Font,
          fontSize: _themeSize.fontSizeMax3,
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            _themeSize.halfRadius(),
          ),
        ),
      ),
    );
  }
  CardTheme customCardTheme() {
    return CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          _themeSize.halfRadius(),
        ),
        side: BorderSide(
          color: _themeColor.redColor,
          width: _themeSize.textFieldBorderSize,
        ),
      ),
    );
  }

  TextTheme customTextTheme() {
    return TextTheme(
      bodySmall: TextStyle(
        color: _themeColor.whiteColor,
        fontWeight: _themeFont.w4Font,
        fontSize: _themeSize.fontSizeMin3,
      ),
      bodyMedium: TextStyle(
        color: _themeColor.whiteColor,
        fontWeight: _themeFont.w5Font,
        fontSize: _themeSize.fontSizeMid,
      ),
      bodyLarge: TextStyle(
        color: _themeColor.blackColor,
        fontWeight: _themeFont.w6Font,
        fontSize: _themeSize.fontSizeMid,
      ),
      labelSmall: TextStyle(
        color: _themeColor.blackColor,
        fontWeight: _themeFont.w5Font,
        fontSize: _themeSize.fontSizeMin2,
      ),
      //fooddetail text
      labelMedium: TextStyle(
        color: _themeColor.blackColor,
        fontWeight: _themeFont.w5Font,
        fontSize: _themeSize.fontSizeMin3,
      ),
      //contentbutton custom and main
      labelLarge: TextStyle(
        color: _themeColor.whiteColor,
        fontWeight: _themeFont.w5Font,
        fontSize: _themeSize.fontSizeMin3,
      ),
      //drawer info
      titleSmall: TextStyle(
        color: _themeColor.redColor,
        fontWeight: _themeFont.w6Font,
        fontSize: _themeSize.fontSizeMid,
      ),
      //input, search
      titleMedium: TextStyle(
        color: _themeColor.redColor,
        fontWeight: _themeFont.w6Font,
        fontSize: _themeSize.fontSizeMid2,
      ),
      //drawer Button
      titleLarge: TextStyle(
        color: _themeColor.redColor,
        fontWeight: _themeFont.w6Font,
        fontSize: _themeSize.fontSizeMid3,
      ),
      //foodname
      headlineSmall: TextStyle(
        color: _themeColor.whiteColor,
        fontWeight: _themeFont.w7Font,
        fontSize: _themeSize.fontSizeMax,
      ),
      headlineMedium: TextStyle(
        color: _themeColor.blackColor,
        fontWeight: _themeFont.w7Font,
        fontSize: _themeSize.fontSizeMax2,
      ),
      headlineLarge: TextStyle(
        color: _themeColor.redColor,
        fontWeight: _themeFont.w7Font,
        fontSize: _themeSize.fontSizeMax3,
      ),
    );
  }
}

class _ThemeColors {
  final Color mainColor = const Color.fromARGB(255, 244, 225, 231);
  final Color blackColor = Colors.black;
  final Color redColor = Colors.red;
  final Color redColor2 = const Color.fromARGB(255, 233, 104, 94);
  final Color whiteColor = Colors.white;
  final Color greyColor = Colors.grey;
  final Color lightGreyColor = Colors.grey.shade300;
  final Color transparentColor = Colors.transparent;
  final Color millionGrey = const Color(0xFF999999);
}

class _ThemeSizes {
  final double fontSubtitle = 11;
  final double fontSizeMin = 12;
  final double fontSizeMin2 = 14;
  final double fontSizeMin3 = 16;
  final double fontSizeMid = 17;
  final double fontSizeMid2 = 19;
  final double fontSizeMid3 = 21;
  final double fontSizeMax = 24;
  final double fontSizeMax2 = 26;
  final double fontSizeMax3 = 28;

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
  final w1Font = FontWeight.w100;
  final w2Font = FontWeight.w200;
  final w3Font = FontWeight.w300;
  final w4Font = FontWeight.w400;
  final w5Font = FontWeight.w500;
  final w6Font = FontWeight.w600;
  final w7Font = FontWeight.w700;
  final w8Font = FontWeight.w800;
  final w9Font = FontWeight.w900;
}
