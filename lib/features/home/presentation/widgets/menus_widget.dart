import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

class MenusWidget extends ConsumerStatefulWidget {
  const MenusWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MenusWidget> createState() => _MenusWidgetState();
}

class _MenusWidgetState extends ConsumerState<MenusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Txt.t(context, 'lottery_services'),
            style: styleBlack(size: 16, weight: FontWeight.w800),
            maxLines: 1,
          ),
          heightBox(10),
          Wrap(
            spacing: 8.0,
            runSpacing: 6.0,
            children: [
              InkWell(
                onTap: (){
                  AutoRouter.of(context).push(const BuyLotteriesRoute());
                },
                child: _menuItem(
                    icon: HomeMenuIcons.buyLotteryIcon, title: 'buy_lottery'),
              ),
              InkWell(
                child: _menuItem(
                    icon: HomeMenuIcons.lotteryBetting, title: 'lottery_betting'),
              ),
              InkWell(
                child: _menuItem(
                    icon: HomeMenuIcons.lotteryStatistic, title: 'lottery_statistic'),
              ),
              InkWell(
                child: _menuItem(
                    icon: HomeMenuIcons.lotteryResult, title: 'lottery_result'),
              ),
              InkWell(
                onTap: (){
                  AutoRouter.of(context).push(const DreamTreatiseRoute());
                },
                child: _menuItem(
                    icon: HomeMenuIcons.dreamTreatise, title: 'dream_treatise'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({required String icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 33.84,
            height: 28,
            child: SvgPicture.asset(icon, fit: BoxFit.contain),
          ),
          heightBox(10),
          Text(
            Txt.t(context, title),
            style: styleBlack(size: 14, weight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
