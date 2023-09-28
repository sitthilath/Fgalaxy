import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/label_widget.dart';

phoneDecoration({required String hint, String? prefix, String? errorText}) {
  return InputDecoration(
    fillColor: AppColor.fillColor,
    filled: true,
    hintText: hint,
    hintStyle: styleOption(color: AppColor.hintColor, fontWeight: FontWeight.w500, size: 14),
    prefixIcon: SizedBox(
      width: 90,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(AppConstants.phoneIcon),
            ),
            labelText(color: AppColor.blackColor, text: '$prefix', fontWeight: FontWeight.w500)
          ],
        ),
      ),
    ),
    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.fillColor, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.fillColor, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.errorColor, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.errorColor, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    errorText: errorText,
    errorStyle: styleOption(color: AppColor.errorColor, size: 12, fontWeight: FontWeight.w400),
  );
}
simpleDecoration({required String hint, String? errorText}) {
  return InputDecoration(
    fillColor: AppColor.fillColor,
    filled: true,
    hintText: hint,
    hintStyle: styleOption(color: AppColor.hintColor, fontWeight: FontWeight.w500, size: 14),
    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.fillColor, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.fillColor, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.errorColor, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.errorColor, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    errorText: errorText,
    errorStyle: styleOption(color: AppColor.errorColor, size: 12, fontWeight: FontWeight.w400),
    errorMaxLines: 2,
  );
}
