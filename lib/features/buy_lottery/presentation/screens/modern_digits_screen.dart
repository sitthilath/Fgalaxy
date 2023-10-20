import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/lotteries_treatise_provider.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/buy_lottery_text_field.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/confirm_button.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/current_draw_lottery_card.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/lotteries_treatise_list.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/lottery_menus.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/formaters/number_formater.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

@RoutePage()
class ModernDigitsScreen extends ConsumerStatefulWidget {
  static const String routeName = '/modernDigitsScreen';

  const ModernDigitsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ModernDigitsScreen> createState() => _ModernDigitsScreenState();
}

class _ModernDigitsScreenState extends ConsumerState<ModernDigitsScreen> {
  static const List<int> priceList = [
    1000,
    2000,
    3000,
    4000,
    5000,
    6000,
    7000,
    8000,
    9000,
    10000,
    12000
  ];
  static const double minExtent = 0.23;
  static const double maxExtent = 0.7;
  double initialExtent = minExtent;
  final TextEditingController _amountController =
      TextEditingController(text: '1000');
  final TextEditingController _digitsController = TextEditingController();
  bool isLotteriesTreatiseActive = false;
  bool showOtherPrice = false;
  bool hasTimerStopped = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lotteriesTreatiseNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        children: const [
          CurrentDrawLotteryCard(),
        ],
      ),
      bottomSheet: DraggableScrollableSheet(
        initialChildSize: initialExtent,
        minChildSize: minExtent,
        maxChildSize: maxExtent,
        expand: false,
        snapAnimationDuration: const Duration(milliseconds: 200),
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            padding: const EdgeInsets.fromLTRB(17, 14, 17, 24),
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showOtherPrice)
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: priceList.length,
                      padding: const EdgeInsets.only(bottom: 12),
                      itemBuilder: (context, int index) {
                        final price = priceList[index];
                        return InkWell(
                          onTap: () => _selectPriceItem(price),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(right: 11),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isSelectedPrice(price)
                                  ? AppColor.primaryColor
                                  : null,
                              border: isSelectedPrice(price)
                                  ? null
                                  : Border.all(
                                      color: AppColor.primaryColor,
                                    ),
                            ),
                            child: Text(
                              nFormat(price),
                              style: styleOption(
                                  color: isSelectedPrice(price)
                                      ? AppColor.whiteColor
                                      : AppColor.blackColor,
                                  size: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: LotteryMenus(
                        title: 'random_digits',
                        icon: AppConstants.shuffle,
                        isAnimal: false,
                      ),
                    ),
                    widthBox(6),
                    InkWell(
                      onTap: () => _setMaxExtent(!isLotteriesTreatiseActive),
                      child: LotteryMenus(
                        title: 'treatise_title',
                        icon: AppConstants.lotteriesTreatise,
                        isAnimal: isLotteriesTreatiseActive,
                      ),
                    ),
                    widthBox(6),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColor.fillColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: BuyLotteryTextField(
                          controller: _amountController,
                          hint: Txt.t(context, 'input_amount'),
                          onTap: () {
                            setState(() {
                              showOtherPrice = !showOtherPrice;
                              initialExtent = showOtherPrice ? 0.28 : 0.23;
                            });
                          },
                          onChange: (String value) {},
                        ),
                      ),
                    ),
                    widthBox(6),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(right: 5.5),
                        decoration: BoxDecoration(
                          color: AppColor.fillColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: BuyLotteryTextField(
                                controller: _digitsController,
                                hint: Txt.t(context, 'input_digits'),
                                onChange: _searchLotto,
                              ),
                            ),
                            InkWell(
                              child: Container(
                                width: 32,
                                height: 32,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColor.addDigitButtonColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SvgPicture.asset(AppConstants.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                heightBox(12),
                if (isLotteriesTreatiseActive)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: AppColor.borderColor,
                    ))),
                  ),
                isLotteriesTreatiseActive
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          Txt.t(context, 'treatise_title'),
                          style: styleBlack(size: 14, weight: FontWeight.w600),
                        ),
                      )
                    : const ElevatedButton(
                        onPressed: null,
                        child: ConfirmButton(),
                      ),
                if (isLotteriesTreatiseActive)
                  const Expanded(child: LotteriesTreatiseList()),
              ],
            ),
          );
        },
      ),
    );
  }

  void _selectPriceItem(int price) {
    setState(() {
      _amountController.text = price.toString();
    });
    focusDisable(context);
  }

  bool isSelectedPrice(int price) =>
      _amountController.text.contains(price.toString());

  _searchLotto(String value) {
    if (value.length >= 2) {
      ref
          .read(lotteriesTreatiseNotifierProvider.notifier)
          .searchLotteryTreatise(value);
      _setMaxExtent(true);
    } else {
      ref.read(lotteriesTreatiseNotifierProvider.notifier).resetState();
      ref
          .read(lotteriesTreatiseNotifierProvider.notifier)
          .fetchAllLotteriesTreatise();
    }
  }

  _setMaxExtent(bool isExtent) {
    setState(() {
      isLotteriesTreatiseActive = isExtent;
      initialExtent = isLotteriesTreatiseActive ? maxExtent : minExtent;
    });
  }
}
