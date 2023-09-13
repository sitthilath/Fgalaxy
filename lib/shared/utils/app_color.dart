import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/hex_color.dart';
class AppColor {
  static Color primaryColor = HexColor('#131E80');
  static Color primaryPurple = HexColor('#3F51F8');
  static Color primaryBlue = HexColor('#041ADF');
  static Color blackColor = HexColor('#252525');
  static Color grayColor = HexColor('#E3E3E3');
  static Color yellowColor = HexColor('#FFC215');

  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: tintColor(color, 0.1),
      700: tintColor(color, 0.2),
      800: tintColor(color, 0.3),
      900: tintColor(color, 0.4)
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
