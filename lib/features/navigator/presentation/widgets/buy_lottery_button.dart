import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';

class BuyLotteryButton extends ConsumerWidget{
  const BuyLotteryButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: (){
        AutoRouter.of(context).push(const BuyLotteriesRoute());
      },
      child: Container(
        width: 69.97,
        height: 71.33,
        padding: const EdgeInsets.symmetric(horizontal: 9.42, vertical: 13.11),
        margin: const EdgeInsets.only(top: 25.0),
        decoration: ShapeDecoration(
          gradient: const RadialGradient(
            center: Alignment(0.66, 0.67),
            radius: 0,
            colors: [Color(0xFF50B6FF), Color(0xFF1757DF), Color(0xFF215FFC)],
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 9.18,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFF181BAF),
            ),
            borderRadius: BorderRadius.circular(89.62),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 51.14,
              height: 16.88,
              child: Image.asset(AppConstants.appLogo),
            ),
            Text(
              Txt.t(context, "buy_lottery"),
              style: styleWhite(size: 15.64, weight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

}