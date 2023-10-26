import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/input_decoration.dart';

class RandomAmountInput extends StatelessWidget {
  const RandomAmountInput({Key? key, required this.controller, required this.hint, required this.suffix}) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final String suffix;
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
       // LengthLimitingTextInputFormatter(6),
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: styleBlack(size: 14, weight: FontWeight.w400),
      decoration: setAmountDecoration(hint: hint, suffix: suffix),
    );
  }
}
