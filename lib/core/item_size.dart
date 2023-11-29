import 'package:flutter/material.dart';

mixin PageItemSize {
  //obj
  static const double textFieldSize = 50;
  static const double textFieldBorderSize = 3;
  static const int textLimitx = 35;
  static const int textLimit2x = 50;
  static const double spaceObjects = 20;
  static const double spaceObjectsMin = 10;
  static const double foodPhotoHeightSize = 130;
  static const double foodPhotoWidthSize = 120;
  static const double listPhotoHeightSize = 60;
  static const double listPhotoWidthSize = 80;
  static const double bottomNavHeight = 60;
  static const double loginButtonPositionBot = 175;
  static const double loginButtonSymetric = 15;
  static const double alternativeLoginPositionBot = 20;
  static const double firstInputBarPositionBot = 430;
  static const double secondInputBarPositionBot = 360;
  static const double thirdInputBarPositinBot = 290;
  static const double inputBarSymetric = 15;
  static const int drawerLines = 1;

//padding
  static const EdgeInsets pagePaddingx = EdgeInsets.all(8.0);
  static const EdgeInsets pagePadding2x = EdgeInsets.all(16.0);
  static const EdgeInsets objectPaddingx = EdgeInsets.all(8.0);
  static const EdgeInsets objectPadding2x = EdgeInsets.all(16.0);
  static const EdgeInsets buttonPaddingx = EdgeInsets.symmetric(horizontal: 15);
  static const EdgeInsets cardPaddingx = EdgeInsets.symmetric(horizontal: 5);
  static const EdgeInsets listPadding2x = EdgeInsets.symmetric(horizontal: 15);
  static const EdgeInsets listPaddingx = EdgeInsets.symmetric(horizontal: 10);

  static const EdgeInsets bottomPadding =
      EdgeInsets.only(bottom: 25, right: 20, left: 20);
  static const EdgeInsets imagePadding =
      EdgeInsets.only(bottom: 16, right: 16, left: 16, top: 32);

//radius
  static Radius halfRadius() => const Radius.circular(15);
  static Radius fullRadius() => const Radius.circular(30);
  static BorderRadius foodDetailRadius() => const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      );

//elevation
  static const double elevationValue = 8;
  static const double elevationValueOff = 0;
}
