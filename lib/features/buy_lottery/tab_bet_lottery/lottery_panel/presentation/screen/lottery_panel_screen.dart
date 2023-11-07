import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/type_cast.dart';

import '../../../../../../shared/style/text_style.dart';
import '../../../../../../shared/utils/formaters/text_input_with_range_formatter.dart';
import '../../../../../../shared/utils/localization_text.dart';
import '../../../../../../shared/widgets/loadings/circle_loading.dart';
import '../../../../../order_lottery/presentation/providers/order_lottery_state_provider.dart';
import '../providers/lottery_panel_state_provider.dart';
import '../providers/state/lottery_panel_state.dart';
import '../widget/lp_custom_text_field.dart';



class LotteryPanelScreen extends ConsumerWidget {
  LotteryPanelScreen({super.key});

  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lotteryPanelNotifierProvider);
    final notifier = ref.watch(lotteryPanelNotifierProvider.notifier);
    // variables
    final filterNumberList = notifier.numberSelectedPanelList;
     final draggableController = notifier.draggableScrollableController;

    return DraggableScrollableSheet(
      controller: draggableController,
      snapSizes: const [
        0.8,
      ],
      snap: true,
      minChildSize: 0.0,
      initialChildSize: 0.0,
      maxChildSize: 1,
      builder: (context, ScrollController scrollController) {

        return Container(
          height:state.isShowPriceCategory ? MediaQuery.of(context).size.height - 100+53 : MediaQuery.of(context).size.height - 100,
          padding: const EdgeInsets.fromLTRB(19, 16, 19, 0),

          decoration: const ShapeDecoration(
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15))),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            primary: false,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Text(
                  Txt.t(context, "options"),
                  style: styleBlack(size: 14, weight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: SizedBox(
                    height: 31,
                    child: ListView.builder(
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.lotteryPanelTypeList.length,
                        itemBuilder: (context, index) {
                          if (state.state == LotteryPanelConcreteState.loading ||
                              state.state == LotteryPanelConcreteState.initial) {
                            return circlePrimaryLoading();
                          }
                          final data = state.lotteryPanelTypeList[index];
                          return GestureDetector(
                            onTap: () {
                              ref
                                  .read(lotteryPanelNotifierProvider.notifier)
                                  .toggleLotteryPanelType(data.id);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 6.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: ShapeDecoration(
                                gradient:  data.isSelected ? const LinearGradient(
                                  begin: Alignment(-0.00, -1.00),
                                  end: Alignment(-0.00, 0.4),
                                  colors: [Color(0xFF068CDF), Color(0xFF143ED3)],
                                ) : null,
                                color: data.isSelected
                                    ? null
                                    : const Color(0xFFEFF1FF),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 3,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                data.name,
                                textAlign: TextAlign.center,
                                style: styleOption(
                                    color: data.isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    size: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                state.isLotteryPanelTypeSpecial
                    ? Text(
                  Txt.t(context, "choose_number"),
                  style: styleBlack(size: 14, weight: FontWeight.w500),
                )
                    : const SizedBox(),
                state.isLotteryPanelTypeSpecial
                    ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    height: 26,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.numberChooseList.length,
                        itemBuilder: (context, index) {
                          if (state.state ==
                              LotteryPanelConcreteState.loading ||
                              state.state ==
                                  LotteryPanelConcreteState.initial) {
                            return circlePrimaryLoading();
                          }
                          final data = state.numberChooseList[index];
                          return GestureDetector(
                            onTap: () {
                              ref
                                  .read(lotteryPanelNotifierProvider.notifier)
                                  .toggleNumberChoose(data.digit);
                            },
                            child: Container(
                              width: 35,
                              decoration: ShapeDecoration(
                                color: data.isSelected
                                    ? AppColor.primaryBlue
                                    : const Color(0xFFEFF1FF),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 3,
                                    strokeAlign:
                                    BorderSide.strokeAlignOutside,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                    Radius.circular(index == 0 ? 7 : 0),
                                    bottomLeft:
                                    Radius.circular(index == 0 ? 7 : 0),
                                    topRight: Radius.circular(index ==
                                        state.numberChooseList.length - 1
                                        ? 7
                                        : 0),
                                    bottomRight: Radius.circular(index ==
                                        state.numberChooseList.length - 1
                                        ? 7
                                        : 0),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 2.5, right: 1.5),
                                child: Text(
                                  data.digit,
                                  textAlign: TextAlign.center,
                                  style: styleOption(
                                      color: data.isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      size: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                )
                    : const SizedBox(),
                const Divider(),
                GridView.builder(
                    primary: false,
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0),
                    itemCount: state.numberPanelList.length,
                    itemBuilder: (context, index) {
                      if (state.state == LotteryPanelConcreteState.loading ||
                          state.state == LotteryPanelConcreteState.initial) {
                        return circlePrimaryLoading();
                      }

                      final data = state.numberPanelList[index];
                      return Container(
                        width: 28,
                        height: 26,
                        decoration: ShapeDecoration(
                          color: data.isSelected == true
                              ? AppColor.primaryBlue
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 4,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top:4.0),
                              child: Text(
                                data.digit,
                                style: styleOption(
                                    color: data.isSelected == true
                                        ? Colors.white
                                        : Colors.black,
                                    size: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      );
                    }),
                const Divider(),
                Visibility(
                  visible: state.isShowPriceCategory,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List<Widget>.from(state.priceCategoryList.map((item){
                        return GestureDetector(
                          onTap: (){
                            ref.read(lotteryPanelNotifierProvider.notifier).togglePriceSelected(item.id,item.value);
                          },
                          child: Container(
                            width: 62,
                            height: 42,
                            decoration: ShapeDecoration(
                              color: item.isSelected? AppColor.primaryBlue : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: AppColor.primaryBlue),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child:  Align(alignment: Alignment.center,child: Text(item.text,style: styleOption(color: item.isSelected ? Colors.white : Colors.black,size: 14,fontWeight: FontWeight.w600),)),
                          ),
                        );
                      })),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 11.0, bottom: 12.0),
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
                            onTap: (){
                              ref.read(lotteryPanelNotifierProvider.notifier).toggleShowPriceCategory();
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
                              child: Text(state.priceSelected.toString(),style: styleBlack(size: 14,weight: FontWeight.w600),),
                            ),
                          )
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 20.0),
                        child: Text(
                          Txt.t(context, 'or'),
                          style: styleOption(
                              color: Colors.black,
                              size: 14,
                              fontWeight: FontWeight.w400),
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
                            child: LPCustomTextField(
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
                  width: double.maxFinite,
                  height: 46,
                  margin: const EdgeInsets.only(bottom: 24),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF279700),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Adjust the value to change the corner radius
                        ),
                      ),
                      onPressed:
                      filterNumberList.isNotEmpty
                          ?
                          () {

                        if(filterNumberList.isNotEmpty){
                          String priceInput = priceController.text;
                          int desiredLength = 4;
                          while(priceInput.length<desiredLength&&priceInput.isNotEmpty){
                            priceInput= '${priceInput}0';
                          }
                          int? price = priceInput.isNotEmpty?TypeCast.toInt(priceInput):state.priceSelected;
                          ref.read(orderLotteryNotifierProvider.notifier).setOrderLotteryByPanelType(filterNumberList, price);
                          priceController.clear();
                          ref.read(lotteryPanelNotifierProvider.notifier).hideDraggableScroll();

                        }

                      }:null,
                      icon: const Icon(Icons.add),
                      label: Text(
                        Txt.t(context, "add_number"),
                        style: styleWhite(size: 14, weight: FontWeight.w600),
                      )),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
