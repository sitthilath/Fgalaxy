

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/tab_bet_lottery/bet_lottery/presentation/providers/state/bet_lottery_notifier.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/tab_bet_lottery/bet_lottery/presentation/providers/state/bet_lottery_state.dart';

final betLotteryNotifierProvider =
StateNotifierProvider.autoDispose<BetLotteryNotifier, BetLotteryState>((ref) {
  return BetLotteryNotifier()..initPriceSelectList();
});