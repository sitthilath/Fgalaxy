import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../shared/domain/models/order_lottery/order_lottery_model.dart';
import '../../../../../../shared/style/text_style.dart';
import '../../../../../../shared/widgets/help_widget.dart';
import '../providers/order_lottery_state_provider.dart';
import 'digit_with_picture.dart';

class SectionDigit extends ConsumerWidget {
  final String? title;
  final List<OrderLotteryModel>? digitList;

  const SectionDigit({this.digitList, this.title, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: digitList?.isNotEmpty == true,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 23,
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(color: Color(0xFFF0F6FF)),
            child: Text(
              "$title",
              style: styleOption(
                color: Colors.black,
                size: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          heightBox(6),
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: digitList?.length,
              itemBuilder: (context, index) {
                final data = digitList?[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 30,
                                child: Text(
                                  "${index + 1}",
                                  style: styleBlack(
                                      size: 14, weight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )),
                            widthBox(3),
                            DigitWithPicture(digits: "${data?.digit}"),

                          ]),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              ref
                                  .read(orderLotteryNotifierProvider.notifier)
                                  .decreasePrice(
                                      digit: data?.digit, index: index);
                            },
                            child: Container(
                                width: 27,
                                height: 27,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF0F0F0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Color.fromRGBO(37, 37, 37, 1),
                                  size: 15,
                                )),
                          ),
                          widthBox(7),
                          Container(
                            width: 60,
                            height: 27,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFF061BD6)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${data?.amount}",
                                style: styleOption(
                                  color: const Color(0xFF252525),
                                  size: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          widthBox(7),
                          InkWell(
                            onTap: () {
                              ref
                                  .read(orderLotteryNotifierProvider.notifier)
                                  .increasePrice(
                                      digit: data?.digit, index: index);
                            },
                            child: Container(
                                width: 27,
                                height: 27,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF061BD6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18,
                                )),
                          ),
                          widthBox(7),
                          InkWell(
                            onTap: () {
                              ref
                                  .read(orderLotteryNotifierProvider.notifier)
                                  .removeOrder(
                                      digit: data?.digit, index: index);
                            },
                            child: Container(
                                width: 27,
                                height: 27,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD61206),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
