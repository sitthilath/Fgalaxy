import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_18_lottery_app/configs/app_configs.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/input_decoration.dart';

Widget phoneField({required TextEditingController controller, required Function(String value)onValidate, String? errorMsg}) {
  return TextField(
    controller: controller,
    decoration: phoneDecoration(hint: 'xxxxxxxx', prefix: AppConfigs.LA_PREFIX, errorText: errorMsg),
    style: styleBlack(size: 14, weight: FontWeight.w500),
    keyboardType: TextInputType.number,
    inputFormatters: [
      LengthLimitingTextInputFormatter(8),
      FilteringTextInputFormatter.digitsOnly,
    ],
    onChanged: onValidate,
  );
}
