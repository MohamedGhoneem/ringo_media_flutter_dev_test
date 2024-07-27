import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 20.0;
  static double blockSizeVertical = 20.0;
  static double _safeAreaHorizontal = 20.0;
  static double _safeAreaVertical = 20.0;
  static double safeBlockHorizontal = 20.0;
  static double safeBlockVertical = 20.0;

  ///=========================================================
  static late EdgeInsets viewPadding;
  static double paddingDouble = 24.0;
  static double padding = 16.0;
  static double paddingThreeQuarter = 12.0;
  static double paddingHalf = 8.0;
  static double paddingQuarter = 4.0;
  static double appbarHeight = 44;
  static double appbarIconSize = 32.0;
  static double h1FontSize = 36.0;
  static double h2FontSize = 32.0;
  static double h3FontSize = 24.0;
  static double btnTitleFontSize = 24.0;
  static double titleFontSize = 18.0;
  static double subTitleFontSize = 16.0;
  static double textFontSize = 14.0;
  static double iconSize = 24.0;
  static double bottomNavbarHeight = 64.0;
  static double bottomNavbarTextSize = 14.0;
  static double buttonHeight = 56.0;
  static double btnRadius = 8;
  static double borderWidth = 1.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    viewPadding = _mediaQueryData.viewPadding;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    if (screenWidth > 600) {
      padding = 24.0;

      paddingDouble = padding * 2;
      paddingThreeQuarter = (padding / 4) * 3;
      paddingHalf = padding / 2;
      paddingQuarter = padding / 4;
      appbarHeight = 84;
      appbarIconSize = 32.0;
      h1FontSize = 40.0;
      h2FontSize = 38.0;
      h3FontSize = 32.0;
      btnTitleFontSize = 30.0;
      titleFontSize = 26.0;
      subTitleFontSize = 22.0;
      textFontSize = 20.0;
      iconSize = 40.0;
      bottomNavbarHeight = 64.0;
      bottomNavbarTextSize = 18.0;
      buttonHeight = 64.0;
      btnRadius = 12;
      borderWidth = 1.0;
    } else {
      padding = 16.0;
      paddingDouble = padding * 2;
      paddingThreeQuarter = (padding / 4) * 3;
      paddingHalf = padding / 2;
      paddingQuarter = padding / 4;
      paddingThreeQuarter = 12.0;
      paddingHalf = 8.0;
      paddingQuarter = 4.0;
      appbarHeight = 44;
      appbarIconSize = 40.0;
      h1FontSize = 36.0;
      h2FontSize = 32.0;
      h3FontSize = 24.0;
      btnTitleFontSize = 24.0;
      titleFontSize = 18.0;
      subTitleFontSize = 16.0;
      textFontSize = 14.0;
      iconSize = 24.0;
      bottomNavbarHeight = 56.0;
      bottomNavbarTextSize = 14.0;
      buttonHeight = 56.0;
      btnRadius = 8;
      borderWidth = 1.0;
    }
  }
}
