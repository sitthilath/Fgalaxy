
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/table_lottery_list/presentation/providers/state/table_lottery_list_state.dart';

import '../../../../../shared/domain/models/order_lottery/order_lottery_model.dart';

class TableLotteryListNotifier extends StateNotifier<TableLotteryListState>{
  TableLotteryListNotifier(): super(const TableLotteryListState.initial());


  Future<void> setStateTableLotteryList(
      {required List lotteryPayList,required int tabIndex}) async{
    state = state.copyWith(lotteryPayList: lotteryPayList);

    if(tabIndex==0||tabIndex==2){
      if(lotteryPayList.length>1){
        state = state.copyWith(tableState: TableState.moreItem);
      }else{
        state = state.copyWith(tableState: TableState.oneItem);
      }
    }else if(tabIndex==1){
      state = state.copyWith(tableState: TableState.animalItem);
    }else{

      state = state.copyWith(tableState: TableState.noItem);
    }
  }
}