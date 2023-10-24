import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/random_lottery_provider.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/state/random_lottery_state.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/random_amount_input.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/modals/confirm_modal.dart';

import 'lottery_suffix_input.dart';

class RandomLottery extends ConsumerStatefulWidget {
  const RandomLottery({Key? key}) : super(key: key);

  @override
  ConsumerState<RandomLottery> createState() => _RandomLotteryState();
}

class _RandomLotteryState extends ConsumerState<RandomLottery> {
  List<int?> customNumberList = List.filled(6, null);
  final TextEditingController _amountController =
      TextEditingController(text: '10');
  final TextEditingController _priceController =
      TextEditingController(text: '1000');

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(randomLotteryStateNotifierProvider);
    _listenState(state);
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    SvgPicture.asset(
                      AppConstants.shuffle,
                      width: 24,
                      height: 24,
                      color: AppColor.primaryColor,
                    ),
                    widthBox(8),
                    Text(
                      Txt.t(context, 'random_digits'),
                      style: stylePrimary(size: 16, weight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: SvgPicture.asset(AppConstants.close),
              ),
            ],
          ),
          Expanded(
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 0, 14),
                  child: Text(
                    Txt.t(context, 'choose_2d_6d'),
                    style: styleBlack(size: 14, weight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Row(
                      children: List.generate(
                        6,
                        (index) => Expanded(
                          child: InkWell(
                            onTap: () {
                              ref
                                  .read(randomLotteryStateNotifierProvider
                                      .notifier)
                                  .selectDigitsType(index + 1);
                              focusDisable(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              margin: index != 5
                                  ? const EdgeInsets.only(right: 2)
                                  : null,
                              color: state.digitsType == (index + 1)
                                  ? AppColor.primaryColor
                                  : AppColor.fillColor,
                              child: Text(
                                '${index + 1}',
                                style: styleOption(
                                    color: state.digitsType == (index + 1)
                                        ? AppColor.whiteColor
                                        : AppColor.blackColor,
                                    size: 18,
                                    fontWeight: FontWeight.w400),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                      ).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 17, 0, 14),
                  child: Text(
                    Txt.t(context, 'set_digits_for_random'),
                    style: styleBlack(size: 14, weight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        6,
                        (index) => index < state.digitsType
                            ? LotterySuffixInput(
                                onChange: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      customNumberList[index] =
                                          int.parse(value);
                                    });
                                  } else {
                                    setState(() {
                                      customNumberList[index] = null;
                                    });
                                  }
                                },
                              )
                            : widthBox(0)).toList(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Txt.t(context, 'set_amount_lotto_random'),
                              style:
                                  styleBlack(size: 14, weight: FontWeight.w400),
                            ),
                            RandomAmountInput(
                                controller: _amountController,
                                hint: '0',
                                suffix: Txt.t(context, 'amount__random_items')),
                          ],
                        ),
                      ),
                      widthBox(14),
                      Expanded(
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Txt.t(context, 'price_random_item'),
                              style:
                                  styleBlack(size: 14, weight: FontWeight.w400),
                            ),
                            RandomAmountInput(
                                controller: _priceController,
                                hint: '0',
                                suffix: Txt.t(context, 'kip')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: InkWell(
              onTap: () {
                ref
                    .read(randomLotteryStateNotifierProvider.notifier)
                    .randomLottery(
                        customDigitList: customNumberList,
                        numbers: int.parse(_amountController.text),
                        amount: int.parse(_priceController.text));
                focusDisable(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.04, -1.00),
                    end: Alignment(-0.04, 1),
                    colors: [Color(0xFF06A8DF), Color(0xFF143ED3)],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  Txt.t(context, 'random_digits'),
                  style: styleWhite(size: 14, weight: FontWeight.w400),
                ),
              ),
            ),
          ),
          heightBox(20),
        ],
      ),
    );
  }

  void _listenState(RandomLotteryState state) {
    ref.listen(randomLotteryStateNotifierProvider.select((value) => value),
            (previous, next) async {
          if (next.state == RandomLotteryConcreteState.invalid) {
            if (next.isOverNumber) {
              await showInfoModal(
                context,
                content:
                '${Txt.t(context, 'random_modern_lottery_invalid')} ${next.overNumber} ${Txt.t(context, 'numbers')} ${Txt.t(context, 'the_number')} ${state.digitsType} ${Txt.t(context, 'length')}',
              );
            }
          }
        });
  }
}
