import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';

Widget menuBottomItem(
    {required String icon, required String title, required int index, required Function()onTap, required Widget currentScreen, required List<
        Widget> screens,}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.cover,
          ),
        ),
        currentScreen == screens[0]
            ? Text(
          title,
          style: styleWhite(
            size: 14,
            weight: currentScreen == screens[index]
                ? FontWeight.w800
                : FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
            : Text(
          title,
          style: styleWhite(
            size: 14,
            weight: currentScreen == screens[index]
                ? FontWeight.w800
                : FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}