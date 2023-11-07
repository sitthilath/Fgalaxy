

import 'package:equatable/equatable.dart';

import '../../../../../shared/domain/models/order_lottery/order_lottery_model.dart';

enum TableState{
  noItem,
  oneItem,
  moreItem,
  animalItem
}

class TableLotteryListState extends Equatable{
  final List lotteryPayList;
  final TableState tableState;
  final int tabIndex;

  const TableLotteryListState({
    this.tabIndex = -1,
    this.lotteryPayList = const [],
    this.tableState = TableState.noItem
  });

  const TableLotteryListState.initial({
    this.tabIndex = -1,
    this.tableState = TableState.noItem,
    this.lotteryPayList = const [],
  });

  @override
  List<Object?> get props => [];

  TableLotteryListState copyWith({
    int? tabIndex,
    TableState? tableState,
    List? lotteryPayList
  }) => TableLotteryListState(
      tabIndex: tabIndex??this.tabIndex,
      lotteryPayList: lotteryPayList??this.lotteryPayList,tableState:tableState??this.tableState);

}
