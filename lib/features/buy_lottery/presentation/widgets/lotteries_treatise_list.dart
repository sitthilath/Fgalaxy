import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/lotteries_treatise_provider.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/state/lotteries_treatise_state.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/empty_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/circle_loading.dart';

class LotteriesTreatiseList extends ConsumerStatefulWidget {
   const LotteriesTreatiseList({Key? key}) : super(key: key);


  @override
  ConsumerState<LotteriesTreatiseList> createState() =>
      _LotteriesTreatiseListState();
}

class _LotteriesTreatiseListState extends ConsumerState<LotteriesTreatiseList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lotteriesTreatiseNotifierProvider);
    return _selectorWidget(state);
  }

  Widget _selectorWidget(LotteriesTreatiseState state) {
    if (state.isLoading) {
      return Container(
        width: double.infinity,
        height: 80,
        alignment: Alignment.center,
        child: circlePrimaryLoading(),
      );
    } else if (state.hasLotteriesTreatise &&
        state.state == LotteriesTreatiseConcreteState.loaded) {
      return _lotteriesTreatiseList(state);
    } else {
      return Container(
        width: double.infinity,
        height: 80,
        alignment: Alignment.center,
        child: emptyResult(title: Txt.t(context, 'not_found_data')),
      );
    }
  }

  Widget _lotteriesTreatiseList(LotteriesTreatiseState state) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: state.lotteriesTreatiseList.length,
        itemBuilder: (context, int index) {
          final item = state.lotteriesTreatiseList[index];
          return Container(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColor.borderColor,
                )
              ),
            ),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    Txt.t(context, 'add_front_digits'),
                    style: stylePrimary(size: 14, weight: FontWeight.w600),
                    maxLines: 1,
                  ),
                ),
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 33,
                      height: 33,
                      child: item.imageUrl != null
                          ? cacheImageNetwork(item.imageUrl!, isProfile: true)
                          : Image.asset(
                              AppConstants.error,
                              fit: BoxFit.cover,
                            ),
                    ),
                    widthBox(10),
                    Text(
                      item.name,
                      style: styleBlack(size: 14, weight: FontWeight.w500),
                      maxLines: 1,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          children: item.digits
                              .map(
                                (digit) => InkWell(
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(right: 8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                        color: AppColor.primaryColor,
                                      )
                                    ),
                                    child: Text(
                                      digit.digit,
                                      style: styleBlack(
                                          size: 14, weight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ).toList(),
                        ),
                        InkWell(
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppColor.primaryColor,
                            ),
                            child: Text(Txt.t(context, 'full_digits'), style: styleWhite(size: 14, weight: FontWeight.w500)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
