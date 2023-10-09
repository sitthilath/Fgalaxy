import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
                child: _menuItem(
                    icon: HomeMenuIcons.dreamAugur, title: 'dream_augur'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({required String icon, required String title}) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Column(
        children: [
          SizedBox(
            width: 40,
            height: 40,
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
