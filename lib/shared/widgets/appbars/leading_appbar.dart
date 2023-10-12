import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';

class LeadingAppbar extends StatelessWidget implements PreferredSizeWidget {
  const LeadingAppbar(
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
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: (){
          if(context.router.canPop()){
            context.router.pop();
          }else{
            context.router.pushAndPopUntil(NavigatorRoute(), predicate: (_) => false);
          }
        },
        icon: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 6.0),
          decoration: BoxDecoration(
            color: AppColor.leadingColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(AppConstants.leadingIcon, color: AppColor.primaryColor, width: 18, height: 18,),
        ),
      ),
      title: Text(title, style: styleWhite(size: 18, weight: FontWeight.w600)),
      centerTitle: isCenter,
      elevation: 0.0,
      automaticallyImplyLeading: false,
    );
  }
}