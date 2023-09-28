import 'package:flutter/cupertino.dart';

Widget widthBox(double width){
  return SizedBox(width: width);
}
Widget heightBox(double height) => SizedBox(height: height);

Widget? focusDisable(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
  return null;
}
