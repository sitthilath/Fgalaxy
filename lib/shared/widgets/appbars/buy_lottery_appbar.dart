import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

class BuyLotteryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BuyLotteryAppbar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: false,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          if (context.router.canPop()) {
            context.router.pop();
          } else {
            context.router
                .pushAndPopUntil(NavigatorRoute(), predicate: (_) => false);
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
          child: SvgPicture.asset(
            AppConstants.leadingIcon,
            color: AppColor.primaryColor,
            width: 18,
            height: 18,
          ),
        ),
      ),
      title: Text(Txt.t(context, title),
          style: styleWhite(size: 16, weight: FontWeight.w600)),
      actions: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        AppConstants.transaction,
                        width: 25,
                        height: 25,
                      ),
                      Positioned(
                        bottom: -3,
                        right: -3,
                        child: Container(
                          width: 16,
                          height: 16,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.transactionColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: SvgPicture.asset(
                            AppConstants.history,
                            width: 14,
                            height: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                widthBox(6),
                Text(
                  Txt.t(context, 'history'),
                  style: styleWhite(size: 16, weight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
