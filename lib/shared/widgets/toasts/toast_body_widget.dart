import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';

Widget toastMessage(String message, {required Color bgColor, required Color fontColor}){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
      color: bgColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            message,
            style: styleOption(size: 14, fontWeight: FontWeight.w500, color: fontColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}