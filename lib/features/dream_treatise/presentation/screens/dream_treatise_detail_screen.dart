import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/providers/dream_treatise_notifier_provider.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/providers/state/dream_treatise_state.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/widgets/lottery_item.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/widgets/select_all_button.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/utils/messaging.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/leading_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/empty_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/circle_loading.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class DreamTreatiseDetailScreen extends ConsumerStatefulWidget {
  static const String routeName = '/dreamTreatiseDetailScreen';

  const DreamTreatiseDetailScreen(this.id, {Key? key}) : super(key: key);
  final int id;

  @override
  ConsumerState<DreamTreatiseDetailScreen> createState() =>
      _DreamTreatiseDetailScreenState();
}

class _DreamTreatiseDetailScreenState
    extends ConsumerState<DreamTreatiseDetailScreen> {
  bool isSelectAllAnimaLottery = false;
  bool isSelectAllRiskNumbers = false;

  @override
  void initState() {
    super.initState();
    _initialApp();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dreamTreatiseNotifierProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    ref.listen(dreamTreatiseNotifierProvider.select((value) => value), (previous, next) {
      if(next.state == DreamTreatiseConcreteState.failure){
        ref.read(toastMessageProvider).messageError(message: next.message);
      }
    });
    return ThemeApp(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: LeadingAppbar(title: Txt.t(context, 'dream_treatise')),
        body: _selectorWidget(state),
      ),
    );
  }

  _selectorWidget(DreamTreatiseState state) {
    if (state.state == DreamTreatiseConcreteState.loading) {
      return Center(child: circleLoading(color: AppColor.whiteColor));
    } else if (state.state == DreamTreatiseConcreteState.loaded &&
        state.hasDreamTreatise) {
      return _bodyWidget(state);
    } else {
      return Center(
          child: emptyResult(title: Txt.t(context, Messaging.NOT_FOUND_DATA)));
    }
  }

  void _initialApp() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(dreamTreatiseNotifierProvider.notifier)
          .fetchOneDreamTreatise(id: widget.id);
    });
  }

  _bodyWidget(DreamTreatiseState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: AppColor.whiteColor,
            ),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: state.dreamTreatise?.lotteryTreatise.imageUrl ==
                                null
                            ? Image.asset(
                                AppConstants.error,
                                fit: BoxFit.cover,
                              )
                            : cacheImageNetwork(
                                state.dreamTreatise?.lotteryTreatise.imageUrl,
                                isProfile: true,
                              ),
                      ),
                    ),
                    widthBox(14),
                    Expanded(
                      child: Flex(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            '${state.dreamTreatise?.lotteryTreatise.name}',
                            style:
                                styleBlack(size: 16, weight: FontWeight.w500),
                          ),
                          heightBox(6),
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: 12,
                            children: state
                                .dreamTreatise!.lotteryTreatise.digits
                                .map((digit) => Text(digit.digit,
                                    style: styleBlack(
                                        size: 14, weight: FontWeight.w500)))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: AppColor.fillColor,
                  ))),
                ),
                Text(
                  Txt.t(context, 'a_dream'),
                  style: styleBlack(size: 16, weight: FontWeight.w500),
                ),
                heightBox(8),
                Text(
                  '${state.dreamTreatise?.description}',
                  style: styleBlack(size: 16, weight: FontWeight.w400),
                ),
              ],
            ),
          ),
          heightBox(14),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: AppColor.whiteColor,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Txt.t(context, 'animal_lottery'),
                              style:
                                  styleBlack(size: 16, weight: FontWeight.w500),
                            ),
                            SelectAll(
                              onSelect: _onSelectAllAnimalNumbers,
                              isSelectAll: isSelectAllAnimaLottery,
                            ),
                          ],
                        ),
                        heightBox(14),
                        Wrap(
                          spacing: 12,
                          direction: Axis.horizontal,
                          children: state.dreamTreatise!.lotteryTreatise.digits
                              .map(
                                (digit) => InkWell(
                                  child: AnimalLotteryItem(
                                    digits: digit,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        heightBox(20),
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Txt.t(context, 'risk_number'),
                              style:
                                  styleBlack(size: 16, weight: FontWeight.w500),
                            ),
                            SelectAll(
                              onSelect: _onSelectAllRiskNumbers,
                              isSelectAll: isSelectAllRiskNumbers,
                            ),
                          ],
                        ),
                        heightBox(15),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          direction: Axis.horizontal,
                          children: state.dreamTreatise!.dreamDigits
                              .map((digit) => RiskLotteryItem(digits: digit))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: AppColor.primaryColor,
                      ),
                      child: Text(
                        Txt.t(context, 'buy_lottery_risk'),
                        style: styleWhite(size: 14, weight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          heightBox(20),
        ],
      ),
    );
  }

  void _onSelectAllAnimalNumbers() {
    setState(() {
      isSelectAllAnimaLottery = !isSelectAllAnimaLottery;
    });
  }

  _onSelectAllRiskNumbers() {
    setState(() {
      isSelectAllRiskNumbers = !isSelectAllRiskNumbers;
    });
  }
}
