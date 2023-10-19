import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/input_decoration.dart';

class BuyLotteryTextField extends StatelessWidget {
  const BuyLotteryTextField({Key? key, required this.controller, required this.hint, this.onTap, required this.onChange}) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final Function()? onTap;
  final Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      controller: controller,
      style: styleBlack(size: 14, weight: FontWeight.w600),
      keyboardType: TextInputType.number,
      decoration: buyLotteryDecoration(hint: hint),
      onTap: onTap,
      onChanged: onChange,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
