

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/pay_lottery/domain/repositories/pay_lottery_repository.dart';
import 'package:galaxy_18_lottery_app/features/pay_lottery/presentation/providers/state/pay_lottery_state.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/pay_lottery/pay_lottery_form.dart';
import '../../../../../shared/domain/models/order_lottery/order_lottery_model.dart';
import '../../../../../shared/exceptions/http_exception.dart';

class PayLotteryNotifier extends StateNotifier<PayLotteryState>{

  final PayLotteryRepository payLotteryRepository;

  PayLotteryNotifier({required this.payLotteryRepository,}) : super(const PayLotteryState.initial());

  Future<void> payLottery(List<Lottery> lotteries) async {
    state = state.copyWith(
      state: PayLotteryConcrete.loading,
    );
    final response = await payLotteryRepository.payLottery(
        payLotteryForm: PayLotteryForm(lotteries: lotteries,lotteryType: state.lotteryType,));
    await response.fold((failure){
      state = state.copyWith(
        state: PayLotteryConcrete.failure,
        message: failure.message,
        statusCode: failure.statusCode,
      );
    }, (data) async {
      if (data.lotteryUserOrderDetails?.isNotEmpty==true) {
        state = state.copyWith(
          state: PayLotteryConcrete.success,
          statusCode: 200,
          paymentHistoryId: data.id
        );
      }else {
        state = state.copyWith(
          state: PayLotteryConcrete.failure,
          message: CacheFailureException().message,
          statusCode: 0,
        );
      }
    });
  }

  Future<void> setLotteryPayList(
      {required List<OrderLotteryModel> lotteryPayList,required int tabIndex,required int total}) async{
    state = state.copyWith(lotteryPayList: lotteryPayList,total: total);

    if(tabIndex==0 || tabIndex==2){
      state = state.copyWith(lotteryType: "modern-lottery");
    }else if(tabIndex==1){
      state = state.copyWith(lotteryType: "animal-lottery");
    }
  }
}