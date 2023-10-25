import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/input_decoration.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({Key? key, required this.controller, this.errorMsg, required this.onChange}) : super(key: key);
  final TextEditingController controller;
  final String? errorMsg;
  final Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      controller: controller,
      onChanged: onChange,
      decoration: phoneDecoration(hint: '20xxxxxxxx', prefix: LA_PREFIX, errorText: errorMsg),
      style: styleBlack(size: 14, weight: FontWeight.w400),
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
