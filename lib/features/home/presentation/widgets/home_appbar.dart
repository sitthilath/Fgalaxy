import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/hex_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppbar({Key? key, this.hasUnreadMessage = false})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();

  final bool hasUnreadMessage;

  @override
  final Size preferredSize;
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      leadingWidth: 115.15,
      scrolledUnderElevation: 6.0,
      shadowColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: SizedBox(
          width: 115.15,
          height: 38,
          child: Image.asset(AppConstants.appLogo, fit: BoxFit.contain),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Stack(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(
                  AppConstants.bellIcon,
                  color: AppColor.whiteColor,
                ),
              ),
              if(widget.hasUnreadMessage)
              Positioned(
                top: -2.2,
                right: 0,
                child: Container(
                  width: 12.1,
                  height: 12.1,
                  decoration: BoxDecoration(
                    color: AppColor.primaryRed,
                    borderRadius: BorderRadius.circular(6.1),
                    border: Border.all(
                      color: HexColor('#49A7EB'),
                      width: 2.14,
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
