import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/utils/lottery-chance/calculate_time_until_next_lottery.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

class LotteryChance extends ConsumerStatefulWidget {
  const LotteryChance({Key? key}) : super(key: key);

  @override
  ConsumerState<LotteryChance> createState() => _LotteryChanceState();
}

class _LotteryChanceState extends ConsumerState<LotteryChance> {
 final List<int> lotteryDaysOfWeeks = [DateTime.monday, DateTime.wednesday, DateTime.friday];
   late Map<String, int> timeUntilNextLottery;
   late Timer _timer;

  @override
  void initState() {
    super.initState();
    timeUntilNextLottery = calculateTimeUntilNextLottery(lotteryDaysOfWeeks);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Text('${Txt.t(context, 'chance_date')} 06-10-2023',
              style: styleBlack(size: 16, weight: FontWeight.w800)),
          Text(Txt.t(context, 'close_lottery_chance'),
              style: styleBlack(size: 14, weight: FontWeight.w400)),
          heightBox(15),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _timeBox(timeUntilNextLottery['days']!, 'day'),
              _timeBox(timeUntilNextLottery['hours']!, 'hour'),
              _timeBox(timeUntilNextLottery['minutes']!, 'minute'),
              _timeBox(timeUntilNextLottery['seconds']!, 'second'),
            ],
          ),
        ],
      ),
    );
  }
  _timeBox(int time, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            time.toString(),
            style: styleWhite(weight: FontWeight.w800, size: 20),
          ),
        ),
        heightBox(10),
        Text(
          Txt.t(context, title),
          style: styleBlack(weight: FontWeight.w400, size: 12),
        ),
      ],
    );
  }
}
