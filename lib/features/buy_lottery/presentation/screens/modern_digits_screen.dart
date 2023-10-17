import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/buy_lottery_text_field.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/confirm_button.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/lotteries_treatise_list.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
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
  final TextEditingController _amountController =
      TextEditingController(text: '1000');
  final TextEditingController _digitsController = TextEditingController();
  bool isLotteriesTreatiseActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [],
      ),
      bottomSheet: DraggableScrollableSheet(
        initialChildSize: isLotteriesTreatiseActive? 0.6 : 0.23,
        minChildSize: 0.23,
        maxChildSize: 0.6,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child:
                          _lotteryMenus('random_digits', AppConstants.shuffle, false),
                    ),
                    widthBox(6),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isLotteriesTreatiseActive = !isLotteriesTreatiseActive;
                        });
                      },
                      child: _lotteryMenus('animal_digits_button',
                          AppConstants.lotteriesTreatise, isLotteriesTreatiseActive),
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColor.borderColor,
                      )
                    )
                  ),
                ),
                isLotteriesTreatiseActive
                    ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                          Txt.t(context, 'treatise_title'),
                          style: styleBlack(size: 14, weight: FontWeight.w600),
                        ),
                    )
                    : const ConfirmButton(),
                if(isLotteriesTreatiseActive)
                  const Expanded(child: LotteriesTreatiseList()),
              ],
            ),
          );
        },
      ),
    );
  }

  _lotteryMenus(String title, String icon, bool isAnimal) {
    return Container(
      width: 40,
      alignment: Alignment.center,
      child: Flex(
        direction: Axis.vertical,
        children: [
          SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            color: isAnimal? AppColor.primaryColor:AppColor.randomDigitsButtonColor,
          ),
          Text(
            Txt.t(context, title),
            style: styleOption(
                color: isAnimal? AppColor.primaryColor:AppColor.randomDigitsButtonColor,
                size: 14,
                fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
