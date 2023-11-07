import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/current_draw_lottery_card.dart';
import 'package:galaxy_18_lottery_app/features/pay_lottery/presentation/providers/pay_lottery_notifier_provider.dart';
import 'package:galaxy_18_lottery_app/features/table_lottery_list/presentation/providers/table_lottery_list_notifier_provider.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/formaters/number_formater.dart';

import '../../../../../../../shared/utils/app_color.dart';
import '../../../../../../../shared/utils/formaters/text_input_with_range_formatter.dart';
import '../../../../../../../shared/utils/localization_text.dart';
import '../../../../../../../shared/utils/type_cast.dart';
import '../../../../../order_lottery/presentation/providers/order_lottery_state_provider.dart';
import '../../../../../order_lottery/presentation/screen/order_lottery_screen.dart';
import '../../../lottery_panel/presentation/providers/lottery_panel_state_provider.dart';
import '../../../lottery_panel/presentation/screen/lottery_panel_screen.dart';
import '../providers/bet_lottery_notifier_provider.dart';
import '../widget/bl_custom_text_field.dart';

@RoutePage()
class BetLotteryScreen extends ConsumerWidget {
  static const String routeName = '/betLotteryScreen';

   BetLotteryScreen({super.key});

  final FocusNode digitFocusNode = FocusNode();
  final TextEditingController digitController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final state = ref.watch(betLotteryNotifierProvider);
    final lotteryPanelState = ref.watch(lotteryPanelNotifierProvider);

    final orderLotteryState = ref.watch(orderLotteryNotifierProvider);


    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Visibility(
              visible: (orderLotteryState.amount[orderLotteryState.tabState]??0) <= 0,
              replacement: const OrderLotteryScreen(),
              child:
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric( horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const CurrentDrawLotteryCard(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                        child: Row(children: [
                          const Icon(
                            Icons.error,
                            color: Colors.white,
                            size: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              Txt.t(context, "betting_conditions"),
                              style: styleWhite(size: 14, weight: FontWeight.w400),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                            left: 26.0, top: 17.0, bottom: 17.0),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${Txt.t(context, "minimum_bet_per_time")} : 10,000 ${Txt.t(context, "kip")}",
                              style: styleOption(
                                  color: const Color(0xFF252525),
                                  size: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                                "${Txt.t(context, "maximum_bet_per_time")}  : 100,000 ${Txt.t(context, "kip")}",
                                style: styleOption(
                                    color: const Color(0xFF252525),
                                    size: 14,
                                    fontWeight: FontWeight.w400)),
                            Text(
                                "${Txt.t(context, "maximum_bet_per_number")}  : 1,000,000 ${Txt.t(context, "kip")}",
                                style: styleOption(
                                    color: const Color(0xFF252525),
                                    size: 14,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
              height: state.isShowPriceCategory ? 275 + ((orderLotteryState.amount[orderLotteryState.tabState]??0) > 0?37:0) : 223 + ((orderLotteryState.amount[orderLotteryState.tabState]??0) > 0?37:0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Visibility(
                    visible: (orderLotteryState.amount[orderLotteryState.tabState]??0) > 0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Txt.t(context, "all_total"),
                              style: styleOption(
                                color: const Color(0xFF252525),
                                size: 14,
                                fontWeight: FontWeight.w400,
                              )),
                          Text(
                            '${nFormat((orderLotteryState.total[orderLotteryState.tabState]??0))} ກີບ',
                            style: styleOption(
                              color: const Color(0xFF002FB2),
                              size: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom:12.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                ref.read(lotteryPanelNotifierProvider.notifier).showDraggableScroll();
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppConstants.lotteryPanel,
                                    width: 20,
                                    height: 25,
                                  ),
                                  Text(
                                    Txt.t(context, "lottery_panel"),
                                    style: styleOption(
                                        color: const Color(0xFF4E4E4E),
                                        size: 14,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child:
                                BLCustomTextField(
                                  focusNode: digitFocusNode,
                                  textEditingController: digitController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(6),
                                    FilteringTextInputFormatter.digitsOnly,
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                  ],
                                  hintText: Txt.t(context, 'input_digits'),
                                  suffixIcon: Container(
                                    margin: const EdgeInsets.all(6),
                                    width: 32,
                                    height: 32,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF279700),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                    ),
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0.0,
                                      mini: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                      onPressed:
                                          () {
                                        if(digitController.text.isNotEmpty){
                                          int? parsePrice = TypeCast.toInt(priceController.text);
                                          String priceInput = (parsePrice!=null && parsePrice > 0) ? priceController.text : "1000";
                                          int desiredLength = 4;
                                          while(priceInput.length<desiredLength&&priceInput.isNotEmpty){
                                            priceInput= '${priceInput}0';
                                          }
                                          int? price = priceInput.isNotEmpty
                                              ? TypeCast.toInt(priceInput)
                                              : state.priceSelected;
                                          ref
                                              .read(orderLotteryNotifierProvider.notifier)
                                              .setOrderLotteryByInput(
                                              digitController.text, price!);
                                          digitController.clear();
                                          priceController.clear();
                                          digitFocusNode.requestFocus();
                                        }
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: state.isShowPriceCategory,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List<Widget>.from(state.priceCategoryList.map((item) {
                          return InkWell(
                            onTap: () {
                              ref
                                  .read(betLotteryNotifierProvider.notifier)
                                  .setPriceSelected(item.id, item.value);
                              digitFocusNode.requestFocus();
                            },
                            child: Container(
                              width: 62,
                              height: 42,
                              decoration: ShapeDecoration(
                                color: item.isSelected
                                    ? AppColor.primaryBlue
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: AppColor.primaryBlue),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    item.text,
                                    style: styleOption(
                                        color: item.isSelected
                                            ? Colors.white
                                            : Colors.black,
                                        size: 14,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          );
                        })),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Txt.t(context, 'choose_price'),
                              style: styleOption(
                                  color: Colors.black,
                                  size: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(betLotteryNotifierProvider.notifier)
                                    .toggleShowPriceCategory();
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 18),
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 36,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF4F6FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text("${state.priceSelected}"),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12.0, top: 20.0),
                          child: Column(
                            children: [
                              Text(
                                Txt.t(context, 'or'),
                                style: styleOption(
                                    color: Colors.black,
                                    size: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Txt.t(context, 'input_amount'),
                              style: styleOption(
                                  color: Colors.black,
                                  size: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 36,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child:
                              BLCustomTextField(
                                textEditingController: priceController,
                                inputFormatters: [
                                  TextInputFormatterWithRange(0, 1000000),
                                  FilteringTextInputFormatter.digitsOnly,
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9.]')),
                                ],
                                hintText: Txt.t(context, 'input_price'),

                              ),


                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: (orderLotteryState.isHasOrder[orderLotteryState.tabState]??false) ? const LinearGradient(
                        begin: Alignment(-0.00, -1.00),
                        end: Alignment(-0.00, 0.4),
                        colors: [Color(0xFF068CDF), Color(0xFF143ED3)],
                      ):null,
                      color: (orderLotteryState.isHasOrder[orderLotteryState.tabState]??false) ? null : const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed:
                      (orderLotteryState.isHasOrder[orderLotteryState.tabState]??false) ?
                          () {
                            AutoRouter.of(context).push(const PayLotteryRoute());
                            ref.read(payLotteryNotifierProvider.notifier).setLotteryPayList(
                                total:(orderLotteryState.total[orderLotteryState.tabState]??0),
                              tabIndex:2,
                                lotteryPayList:[
                                  ...orderLotteryState.twoDigitList,
                                  ...orderLotteryState.threeDigitList,
                                  ...orderLotteryState.fourDigitList,
                                  ...orderLotteryState.fiveDigitList,
                                  ...orderLotteryState.sixDigitList
                                ]);

                            ref.read(tableLotteryListNotifierProvider.notifier).setStateTableLotteryList(
                                tabIndex:2,
                                lotteryPayList:[
                                  ...orderLotteryState.twoDigitList,
                                  ...orderLotteryState.threeDigitList,
                                  ...orderLotteryState.fourDigitList,
                                  ...orderLotteryState.fiveDigitList,
                                  ...orderLotteryState.sixDigitList
                                ]);
                          } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Center(
                          child: Text(
                            Txt.t(context, 'confirm_to_buy'),
                        style: styleWhite(size: 14, weight: FontWeight.w600),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Visibility(
            visible:lotteryPanelState.isShowDraggableScroll,
            child: GestureDetector(
              onTap: (){
                ref.read(lotteryPanelNotifierProvider.notifier).hideDraggableScroll();
              },
              child: Container(
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          ),
           LotteryPanelScreen()
        ],
      ),
    );
  }
}
