import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/input_decoration.dart';

Widget passwordField({required TextEditingController controller, required Function(String value)onValidate, String? errorMsg}){
  return TextField(
    controller: controller,
    obscureText: true,
    style: styleBlack(size: 14, weight: FontWeight.w500),
    decoration: simpleDecoration(hint: "", errorText: errorMsg),
    onChanged: onValidate,
  );
}
