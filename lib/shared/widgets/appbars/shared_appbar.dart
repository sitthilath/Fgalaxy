import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';

class SharedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppbar(
      {Key? key,
      required this.title,
      this.isCenter = false,
      this.color = Colors.transparent})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final String title;
  final bool isCenter;
  final Color color;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: InkWell(
          onTap: () => context.router.back(),
          child: Container(
            width: 45,
            height: 45,
            alignment: Alignment.center,
            child: SvgPicture.asset(AppConstants.leadingIcon,
                width: 26, height: 26),
          ),
        ),
      ),
      title: Text(title, style: styleWhite(size: 18, weight: FontWeight.w600)),
      centerTitle: isCenter,
      elevation: 0.0,
      automaticallyImplyLeading: false,
    );
  }
}
