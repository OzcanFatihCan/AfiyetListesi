import 'package:flutter/material.dart';

mixin PageItemSize {
  //obj
  static const double textFieldSize = 50;
  static const double spaceObjects = 20;
  static const double spaceObjectsMin = 10;
  static const double foodPhotoHeightSize = 130;
  static const double foodPhotoWidthSize = 120;
  static const double cardHeightSize = 250;
  static const double cardWidthSize = 170;

//padding
  static const EdgeInsets pagePaddingx = EdgeInsets.all(8.0);
  static const EdgeInsets pagePadding2x = EdgeInsets.all(16.0);
  static const EdgeInsets objectPaddingx = EdgeInsets.all(8.0);
  static const EdgeInsets objectPadding2x = EdgeInsets.all(16.0);
  static const EdgeInsets buttonPaddingx = EdgeInsets.symmetric(horizontal: 15);
  static const EdgeInsets cardPaddingx = EdgeInsets.symmetric(horizontal: 5);
  static const EdgeInsets bottomPadding =
      EdgeInsets.only(bottom: 25, right: 20, left: 20);

//radius
  static Radius halfRadius() => const Radius.circular(15);
  static Radius fullRadius() => const Radius.circular(30);

  static const double elevationValue = 8;

  static const double bottomNavHeight = 60;
}
