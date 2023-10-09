import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';

Widget circlePrimaryLoading(){
  return CircularProgressIndicator(
    strokeWidth: 4,
    valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
  );
}