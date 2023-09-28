import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';

stylePrimary({double size = 12, FontWeight weight = FontWeight.w300}) =>
    TextStyle(
      fontFamily: LAO_FONT_FAMILY,
      fontSize: size,
      fontWeight: weight,
      color: AppColor.primaryColor,
      decoration: TextDecoration.none,
    );

styleBlack({double size = 12, FontWeight weight = FontWeight.w300}) =>
    TextStyle(
      fontFamily: LAO_FONT_FAMILY,
      fontSize: size,
      fontWeight: weight,
      color: AppColor.blackColor,
      decoration: TextDecoration.none,
    );

styleWhite({double size = 12, FontWeight weight = FontWeight.w300}) =>
    TextStyle(
      fontFamily: LAO_FONT_FAMILY,
      fontSize: size,
      fontWeight: weight,
      color: AppColor.whiteColor,
      decoration: TextDecoration.none,
    );

styleOption(
        {double size = 12,
        FontWeight fontWeight = FontWeight.w300,
        required Color color, TextDecoration decoration = TextDecoration.none}) =>
    TextStyle(
        fontFamily: LAO_FONT_FAMILY,
        fontWeight: fontWeight,
        color: color,
        fontSize: size, decoration: decoration);
