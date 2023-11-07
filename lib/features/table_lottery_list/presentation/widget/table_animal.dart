import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/domain/models/order_lottery/order_lottery_model.dart';
import '../../../../shared/style/text_style.dart';
import '../../../../shared/utils/formaters/number_formater.dart';
import '../../../../shared/utils/localization_text.dart';
import 'digit_with_circle_picture.dart';

class TableAnimal extends ConsumerWidget {
  final List orderLotteryList;
  const TableAnimal({required this.orderLotteryList,super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0xFFF0F6FF),
          ),
          child: Padding(
            padding:
            const EdgeInsets.only(top: 4, bottom: 5, left: 0, right: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.only(right: 15),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerRight,
                      child: Text(
                        Txt.t(context, "lucky_number"),
                        style: styleBlack(size: 12, weight: FontWeight.w400),
                        textAlign: TextAlign.right,
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerRight,
                      child: Text(
                        Txt.t(context, "amount"),
                        style: styleBlack(size: 12, weight: FontWeight.w400),
                        textAlign: TextAlign.right,
                      )),
                ),
              ],
            ),
          ),
        ),
        ...orderLotteryList.map((item) {
          List<String> result = [];

          for (int i = 0; i < (item.digit?.length ?? 0); i += 2) {
            if (i + 1 < (item.digit?.length ?? 0)) {
              result.add(item.digit!.substring(i, i + 2));
            }
          }
          return Padding(
            padding: const EdgeInsets.only(top: 12,right: 17.0, left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                      padding: const EdgeInsets.only(right: 15),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: result.map((e) {
                          return DigitWithCirclePicture(digits: e,boxWidth: 5,);
                        }).toList(),
                      ),),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${nFormat(item.amount)}",
                        style: styleBlack(size: 12, weight: FontWeight.w400),
                        textAlign: TextAlign.right,
                      )),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
