import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/input_decoration.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key, required this.controller, this.errorMsg, required this.onChange}) : super(key: key);
  final TextEditingController controller;
  final String? errorMsg;
  final Function(String value)onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      controller: controller,
      obscureText: true,
      style: styleBlack(size: 14, weight: FontWeight.w400),
      onChanged: onChange,
      decoration: simpleDecoration(hint: Txt.t(context, 'input_new_password'), errorText: errorMsg),
    );
  }
}
