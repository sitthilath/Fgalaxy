import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/input_decoration.dart';

class OTPField extends StatelessWidget {
  const OTPField({
    Key? key,
    required this.controller,
    this.errorMsg,
    required this.onChange,
    required this.timer,
    required this.sendAgain,
  }) : super(key: key);
  final TextEditingController controller;
  final String? errorMsg;
  final Function(String value) onChange;
  final int timer;
  final Function() sendAgain;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      controller: controller,
      style: styleBlack(size: 14, weight: FontWeight.w400),
      onChanged: onChange,
      decoration: otpDecoration(context,
          hint: Txt.t(context, 'input_otp_code'),
          errorText: errorMsg,
          timer: timer,
          onPressed: sendAgain),
      inputFormatters: [
        LengthLimitingTextInputFormatter(6),
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
