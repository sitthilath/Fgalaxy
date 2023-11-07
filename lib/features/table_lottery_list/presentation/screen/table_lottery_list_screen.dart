import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/table_lottery_list/presentation/providers/table_lottery_list_notifier_provider.dart';

import '../providers/state/table_lottery_list_state.dart';
import '../widget/table_animal.dart';
import '../widget/table_number.dart';
import '../widget/table_number_one_row.dart';

class TableLotteryListScreen extends ConsumerWidget {
  const TableLotteryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(tableLotteryListNotifierProvider);

    return state.tableState == TableState.oneItem
        ? TableNumberOneRow(orderLotteryList: state.lotteryPayList,)
        : state.tableState == TableState.moreItem
        ? TableNumber(orderLotteryList: state.lotteryPayList,)
        : state.tableState == TableState.animalItem
        ? TableAnimal(orderLotteryList: state.lotteryPayList,)
        : const SizedBox();
  }
}
