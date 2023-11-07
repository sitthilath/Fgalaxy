
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/order_lottery_notifier.dart';
import 'state/order_lottery_state.dart';

final orderLotteryNotifierProvider =
StateNotifierProvider<OrderLotteryNotifier, OrderLotteryState>((ref) {
  return OrderLotteryNotifier();
});