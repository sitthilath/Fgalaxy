import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/utils/formaters/number_formater.dart';
import '../../../../shared/domain/models/order_lottery/order_lottery_model.dart';
import '../../../../shared/style/text_style.dart';
import '../../../../shared/utils/localization_text.dart';
import 'digit_with_circle_picture.dart';

class TableNumber extends ConsumerWidget {
  final List orderLotteryList;
  const TableNumber({required this.orderLotteryList,super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int totalLength = orderLotteryList.length;
    int leftCount = (totalLength / 2).ceil();
    List firstHalf = orderLotteryList.sublist(0, leftCount);
    List secondHalf = orderLotteryList.sublist(leftCount);

    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex:1,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFF0F6FF),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4,bottom: 5,right:17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex:1,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerRight,

                            child: Text(Txt.t(context, "lucky_number"),style: styleBlack(size: 12,weight: FontWeight.w400),textAlign: TextAlign.right,)),
                      ),

                      Flexible(
                        flex:1,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerRight,

                            child: Text(Txt.t(context, "amount"),style: styleBlack(size: 12,weight: FontWeight.w400),textAlign: TextAlign.right,)),
                      ),
                    ],
                  ),
                ),
              ),

              ...firstHalf.map((item) {
                return  Padding(
                  padding: const EdgeInsets.only(top: 12,right:17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex:1,
                        child: Container(

                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerRight,

                            child: DigitWithCirclePicture(digits: item.digit!,rowMainAxisAlignment: MainAxisAlignment.spaceBetween,)),
                      ),

                      Flexible(
                        flex:1,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerRight,

                            child: Text("${nFormat(item.amount)}",style: styleBlack(size: 12,weight: FontWeight.w400),textAlign: TextAlign.right,)),
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFF0F6FF),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4,bottom: 5,right:17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Flexible(
                        flex:1,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerRight,

                            child: Text(Txt.t(context, "lucky_number"),style: styleBlack(size: 12,weight: FontWeight.w400),textAlign: TextAlign.right,)),
                      ),

                      Flexible(
                        flex:1,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerRight,

                            child: Text(Txt.t(context, "amount"),style: styleBlack(size: 12,weight: FontWeight.w400),textAlign: TextAlign.right,)),
                      ),

                    ],
                  ),
                ),
              ),
              ...secondHalf.map((item) {
                return  Padding(
                  padding: const EdgeInsets.only(top: 12,right:17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex:1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerRight,

                            child: DigitWithCirclePicture(digits: item.digit!,rowMainAxisAlignment: MainAxisAlignment.spaceBetween,)),
                      ),

                      Flexible(
                        flex:1,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerRight,

                            child: Text("${nFormat(item.amount)}",style: styleBlack(size: 12,weight: FontWeight.w400),textAlign: TextAlign.right,)),
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ],
    );
  }
}
