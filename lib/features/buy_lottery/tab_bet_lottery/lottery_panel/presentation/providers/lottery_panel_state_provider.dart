

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/tab_bet_lottery/lottery_panel/presentation/providers/state/lottery_panel_notifier.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/tab_bet_lottery/lottery_panel/presentation/providers/state/lottery_panel_state.dart';

final lotteryPanelNotifierProvider =
StateNotifierProvider.autoDispose<LotteryPanelNotifier, LotteryPanelState>((ref) {
  return LotteryPanelNotifier()..initialize();
});
