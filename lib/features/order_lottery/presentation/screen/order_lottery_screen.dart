import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';

import '../../../../../../shared/utils/localization_text.dart';
import '../providers/order_lottery_state_provider.dart';
import '../widget/section_animal_digit.dart';
import '../widget/section_digit.dart';

class OrderLotteryScreen extends ConsumerWidget {
  const OrderLotteryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderLotteryNotifierProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 22),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${Txt.t(context, "list")} (${state.amount[state.tabState]})",
                    style: styleBlack(size: 14, weight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        ref.read(orderLotteryNotifierProvider.notifier).removeAllOrder();
                      },
                      child: Text(
                        Txt.t(context, "remove_all"),
                        style: styleOption(
                            color: const Color(0xFFD61206),
                            size: 14,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),

              Visibility(
                visible: state.typeDigit != 1,
                  replacement: SectionAnimalDigit(digitList:state.animalDigitList),
                  child: Column(children: [
                    SectionDigit(title: Txt.t(context, "two_digit"),digitList: state.twoDigitList),
                    SectionDigit(title: Txt.t(context, "three_digit"),digitList: state.threeDigitList),
                    SectionDigit(title: Txt.t(context, "four_digit"),digitList: state.fourDigitList),
                    SectionDigit(title: Txt.t(context, "five_digit"),digitList: state.fiveDigitList),
                    SectionDigit(title: Txt.t(context, "six_digit"),digitList: state.sixDigitList),
                  ],)
              ),


            ],
          ),
        ),
      ),
    );
  }
}
