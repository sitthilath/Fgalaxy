import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';

class LotteryMenus extends StatelessWidget {
  const LotteryMenus({Key? key, required this.icon, required this.title, required this.isAnimal}) : super(key: key);

  final String icon;
  final String title;
  final bool isAnimal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      alignment: Alignment.center,
      child: Flex(
        direction: Axis.vertical,
        children: [
          SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            color: isAnimal? AppColor.primaryColor:AppColor.randomDigitsButtonColor,
          ),
          Text(
            Txt.t(context, title),
            style: styleOption(
                color: isAnimal? AppColor.primaryColor:AppColor.randomDigitsButtonColor,
                size: 14,
                fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
