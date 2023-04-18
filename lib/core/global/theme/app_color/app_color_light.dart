import 'package:flutter/material.dart';

class AppColorsLight {
  static const primaryColor = Colors.blue;
  static const appBarColor = Colors.deepPurple;
}

class ColorManger {
  static Color primary = HexColor.fromHex('#E79EFF');
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color grey = HexColor.fromHex('#767676');
  static Color lightGrey = HexColor.fromHex('#9E9E9E');
  static Color primaryOpacity70 = HexColor.fromHex('#B3ED9728');

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color bottomAppbarColor = HexColor.fromHex("#BE05FA");
  static Color selectedItemColor = HexColor.fromHex("#BE05FA");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34"); // red color
  static Color black = HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
