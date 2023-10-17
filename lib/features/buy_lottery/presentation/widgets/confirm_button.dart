import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Container(
        width: double.infinity,
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: null,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          Txt.t(context, 'confirm_to_buy'),
          style: styleWhite(size: 14, weight: FontWeight.w600),
        ),
      ),
    );
  }
}
