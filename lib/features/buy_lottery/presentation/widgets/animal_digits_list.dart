import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/lotteries_treatise_provider.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/theme/provider/theme_provider.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/empty_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/circle_loading.dart';

class AnimalDigitsList extends ConsumerWidget {
  const AnimalDigitsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lotteriesTreatiseNotifierProvider);
    final bgGradient = ref.watch(themeProvider).backgroundGradient();
    return Expanded(
      child: state.isLoading
          ? Center(
              child: circlePrimaryLoading(),
            )
          : state.hasLotteriesTreatise
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: state.lotteriesTreatiseList.map((item) {
                      return InkWell(
                        child: Container(
                          width: 60,
                          height: 47,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            gradient: bgGradient,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              Expanded(
                                child: Text(
                                  item.name,
                                  style: styleWhite(
                                      size: 10, weight: FontWeight.w400),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteColor,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      )),
                                  child: Flex(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    direction: Axis.horizontal,
                                    children: [
                                      SizedBox(
                                        width: 18.5,
                                        height: 18.5,
                                        child: item.imageUrl == null
                                            ? Image.asset(
                                                AppConstants.error,
                                                fit: BoxFit.cover,
                                              )
                                            : cacheImageNetwork(item.imageUrl!,
                                                isProfile: true),
                                      ),
                                      widthBox(6),
                                      Text(
                                        item.digits.last.digit.toString(),
                                        style:
                                            styleBlack(weight: FontWeight.w500),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
              )
              : Center(
                  child: emptyResult(title: Txt.t(context, 'data_not_found')),
                ),
    );
  }
}
