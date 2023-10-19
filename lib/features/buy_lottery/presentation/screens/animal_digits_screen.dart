import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/animal_digits_list.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/confirm_button.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/lottery_menus.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

@RoutePage()
class AnimalDigitsScreen extends ConsumerStatefulWidget {
  static const String routeName = '/animalDigitsScreen';

  const AnimalDigitsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AnimalDigitsScreen> createState() => _AnimalDigitsScreenState();
}

class _AnimalDigitsScreenState extends ConsumerState<AnimalDigitsScreen> {
  static const double minExtent = 0.23;
  static const double maxExtent = 1;
  double initialExtent = minExtent;
  bool isLotteriesTreatiseActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(),
      bottomSheet: DraggableScrollableSheet(
          minChildSize:minExtent ,
          maxChildSize: maxExtent,
          initialChildSize: initialExtent,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  )),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    if(isLotteriesTreatiseActive)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              Txt.t(context, 'animal_lottery'),
                              style: styleBlack(size: 14, weight: FontWeight.w500),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isLotteriesTreatiseActive = false;
                                  initialExtent = minExtent;
                                });
                              },
                              icon: SvgPicture.asset(AppConstants.close)),
                        ],
                      ),
                    if(isLotteriesTreatiseActive)
                      const AnimalDigitsList(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(17, 17, 17, 0),
                      child: Row(
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
                            onTap: () {
                              setState(() {
                                isLotteriesTreatiseActive =
                                    !isLotteriesTreatiseActive;
                                initialExtent = isLotteriesTreatiseActive? maxExtent: minExtent;
                              });
                            },
                            child: LotteryMenus(
                              title: 'animal_digits_button',
                              icon: AppConstants.lotteriesTreatise,
                              isAnimal: isLotteriesTreatiseActive,
                            ),
                          ),
                          Expanded(
                            child: Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 52,
                                  height: 56,
                                  margin: const EdgeInsets.only(right: 3),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.fillColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child:
                                      SvgPicture.asset(AppConstants.question),
                                ),
                                Container(
                                  width: 52,
                                  height: 56,
                                  margin: const EdgeInsets.only(right: 3),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.fillColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child:
                                      SvgPicture.asset(AppConstants.question),
                                ),
                                Container(
                                  width: 52,
                                  height: 56,
                                  margin: const EdgeInsets.only(right: 3),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.fillColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child:
                                      SvgPicture.asset(AppConstants.question),
                                ),
                                Container(
                                  width: 52,
                                  height: 56,
                                  margin: const EdgeInsets.only(right: 3),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColor.fillColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child:
                                      SvgPicture.asset(AppConstants.question),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 52,
                            height: 56,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.addDigitButtonColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppConstants.add),
                                Text(
                                  Txt.t(context, 'add'),
                                  style: styleWhite(
                                      size: 14, weight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    heightBox(12),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(17, 0, 17, 23),
                      child: ElevatedButton(
                          onPressed: null, child: ConfirmButton()),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
