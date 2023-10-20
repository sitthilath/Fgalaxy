import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key, this.hasOrder = false}) : super(key: key);

  final bool hasOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: hasOrder? AppColor.primaryColor: null,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        Txt.t(context, 'confirm_to_buy'),
        style: styleWhite(size: 14, weight: FontWeight.w600),
      ),
    );
  }
}
