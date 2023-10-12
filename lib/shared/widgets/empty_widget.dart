import 'package:flutter/cupertino.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

Widget emptyResult(
    {required String title, double width = 100, double height = 100}) {
  return Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        direction: Axis.vertical,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              AppConstants.emptyBox,
              fit: BoxFit.cover,
            ),
          ),
          heightBox(10),
          Text(
            title,
            style: styleOption(
                color: AppColor.blackColor, size: 14, fontWeight: FontWeight.w600),
          ),
        ],
      );
}
