import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../shared/domain/models/order_lottery/order_lottery_model.dart';
import '../../../../../../shared/style/text_style.dart';
import '../../../../../../shared/widgets/help_widget.dart';
import '../providers/order_lottery_state_provider.dart';
import 'animal_with_picture.dart';

class SectionAnimalDigit extends ConsumerWidget {
  final List<OrderLotteryModel>? digitList;

  const SectionAnimalDigit({this.digitList, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Visibility(
      visible: digitList?.isNotEmpty == true,
      child: Column(
        children: [

          heightBox(6),
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: digitList?.length,
              itemBuilder: (context, index) {
                final data = digitList?[index];

                List<String> result = [];

                for (int i = 0; i < (data?.digit?.length ?? 0); i += 2) {
                  if (i + 1 < (data?.digit?.length ?? 0)) {
                    result.add(data!.digit!.substring(i, i + 2));
                  }
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 30,
                                child: Text(
                                  "${index + 1}. ",
                                  style: styleBlack(
                                      size: 14, weight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )),
                            widthBox(8),

                            Row(
                              children: result.map((e) {
                                return AnimalWithPicture(digits: e);
                              }).toList(),
                            ),

                          ]),
                      Row(
                        children: [
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
