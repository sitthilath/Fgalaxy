import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/table_lottery_list/presentation/providers/state/table_lottery_list_notifier.dart';
import 'package:galaxy_18_lottery_app/features/table_lottery_list/presentation/providers/state/table_lottery_list_state.dart';

final tableLotteryListNotifierProvider =
StateNotifierProvider<TableLotteryListNotifier, TableLotteryListState>((ref) {
  return TableLotteryListNotifier();
});