import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/input_decoration.dart';

class LotterySuffixInput extends StatelessWidget {
  const LotterySuffixInput({Key? key, required this.onChange})
      : super(key: key);
  final Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.fillColor,
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment(0.04, -1.00),
          end: Alignment(-0.04, 1),
          colors: [Color(0xFF06A8DF), Color(0xFF143ED3)],
        ),
      ),
      child: TextField(
        key: key,
        keyboardType: TextInputType.number,
        style: styleWhite(size: 18, weight: FontWeight.w400),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: setDigitDecoration(hint: '?'),
        onChanged: onChange,
      ),
    );
  }
}
