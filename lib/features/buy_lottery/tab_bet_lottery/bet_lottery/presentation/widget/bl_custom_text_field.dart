import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../shared/style/text_style.dart';
import '../../../../../../shared/utils/app_color.dart';

class BLCustomTextField extends ConsumerWidget {
  final FocusNode? focusNode;
  final TextEditingController textEditingController;
  final List<TextInputFormatter> inputFormatters;
  final String hintText;
  final Widget? suffixIcon;
  const BLCustomTextField({this.focusNode, required this.textEditingController, required this.inputFormatters, required this.hintText,  this.suffixIcon, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      focusNode: focusNode,
      controller: textEditingController,
      inputFormatters: inputFormatters,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: const Color(0xFFF4F6FF),
        filled: true,
        hintText: hintText,
        hintStyle: styleOption(
            color: AppColor.hintColor,
            fontWeight: FontWeight.w500,
            size: 14),
        contentPadding:
        const EdgeInsets.fromLTRB(10, 10, 10, 10),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColor.fillColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColor.fillColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColor.errorColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColor.errorColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorText: null,
        errorStyle: styleOption(
            color: AppColor.errorColor,
            size: 12,
            fontWeight: FontWeight.w400),
        errorMaxLines: 2,
      ),
    );
  }
}
