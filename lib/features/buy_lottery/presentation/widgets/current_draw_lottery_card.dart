import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/widgets/separator.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/presentation/providers/current_draw_lottery_provider.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/presentation/providers/state/current_draw_lottery_state.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/presentation/widgets/current_draw_lottery_countdown.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/presentation/widget/last_lottery_result.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/formaters/date_formatter.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/circle_loading.dart';

class CurrentDrawLotteryCard extends ConsumerWidget {
  const CurrentDrawLotteryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentDrawLotteryStateNotifierProvider);
    ref.listen(currentDrawLotteryStateNotifierProvider.select((value) => value),
        (previous, next) {
      if (next.state == CurrentDrawLotteryConcreteState.loaded) {
        ref
            .read(currentDrawLotteryStateNotifierProvider.notifier)
            .calculateTimeRemaining();
      }
    });
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.whiteColor,
        ),
        child: _selector(state, context));
  }

  _selector(CurrentDrawLotteryState state, BuildContext context) {
    if (state.state == CurrentDrawLotteryConcreteState.loading) {
      return circlePrimaryLoading();
    } else if (state.state != CurrentDrawLotteryConcreteState.expired &&
        state.state != CurrentDrawLotteryConcreteState.close) {
      return Column(
        children: [
          _body(state, context),
          heightBox(11),
          const LastLotteryResult(),
        ],
      );
    } else {
      return Text(
        Txt.t(context, 'draw_lotto_is_closed'),
        style: styleBlack(size: 16, weight: FontWeight.w600),
      );
    }
  }

  _body(CurrentDrawLotteryState state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${Txt.t(context, 'draw_lottery_date')} ${dFormat(state.currentDrawLottery!.endDate)}',
          style: styleBlack(size: 16, weight: FontWeight.w600),
        ),
        heightBox(6),
        Text(
          Txt.t(context, 'close_lottery_draw'),
          style: styleBlack(size: 14, weight: FontWeight.w400),
        ),
        heightBox(10),
        CountdownCurrentDrawLottery(
          secondsRemaining: state.secondsRemaining,
          whenTimeExpires: () {
            state.copyWith(
              secondsRemaining: 0,
              state: CurrentDrawLotteryConcreteState.expired,
            );
          },
          countDownTimerStyle: const TextStyle(
            color: Color(0XFFf5a623),
            fontSize: 17.0,
            height: 1.2,
          ),
        ),
         heightBox(13),
         MySeparator(color: AppColor.borderColor),
      ],
    );
  }
}
