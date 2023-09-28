import 'package:flutter/cupertino.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

Widget labelText({ required Color color, double size = 14, FontWeight fontWeight = FontWeight.w300, required String text}){
  return Text(text, style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight, fontFamily: LAO_FONT_FAMILY, decoration: TextDecoration.none));
}