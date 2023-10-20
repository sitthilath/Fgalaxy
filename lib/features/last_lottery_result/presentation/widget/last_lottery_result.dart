import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/presentation/providers/last_lottery_result_provider.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/formaters/date_formatter.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/circle_loading.dart';

class LastLotteryResult extends ConsumerWidget {
  const LastLotteryResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lastLotteryResultStateNotifierProvider);
    return state.isLoading
        ? Center(
            child: circlePrimaryLoading(),
          )
        : state.hasLotteryResult
            ? Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${Txt.t(context, 'last_lottery_result')} ${dFormat(state.lastLotteryResult?.endDate)}',
                    style: styleBlack(size: 16, weight: FontWeight.w600),
                  ),
                  heightBox(6),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.lotteriesTreatise != null)
                        SizedBox(
                          width: 50,
                          height: 70,
                          child: state.lotteriesTreatise?.imageUrl != null
                              ? cacheImageNetwork(
                                  state.lotteriesTreatise!.imageUrl!,
                                  isProfile: true)
                              : Image.asset(
                                  AppConstants.error,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      widthBox(20),
                      Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.lotteriesTreatise != null
                                ? '${state.lotteriesTreatise?.name}'
                                : '',
                            style:
                                styleBlack(size: 16, weight: FontWeight.w800),
                          ),
                          heightBox(8),
                          Flex(
                            direction: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state.lastLotteryResult!.lotteryResults
                                .map((item) {
                              if (item.lotteryType != 'animal-lottery') {
                                return Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.only(right: 3.5),
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment(-0.00, -1.00),
                                      end: Alignment(0, 1),
                                      colors: [
                                        Color(0xFFF1B200),
                                        Color(0xFFFDE24F),
                                        Color(0xFFF1AD00)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(42.29),
                                    ),
                                  ),
                                  child: Text(
                                    item.value,
                                    style: styleBlack(
                                        size: 20, weight: FontWeight.w600),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }
                              return heightBox(0);
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  heightBox(20),
                ],
              )
            : heightBox(0);
  }
}
