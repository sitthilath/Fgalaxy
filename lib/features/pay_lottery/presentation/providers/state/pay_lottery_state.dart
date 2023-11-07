
import 'package:equatable/equatable.dart';

import '../../../../../shared/domain/models/order_lottery/order_lottery_model.dart';

enum PayLotteryConcrete{
  initial,
  loading,
  success,
  failure
}

class PayLotteryState extends Equatable{
  final List<OrderLotteryModel> lotteryPayList;
  final String lotteryType;
  final int tabIndex;
  final int total;
  final PayLotteryConcrete state;
  final String message;
  final int statusCode;
  final int paymentHistoryId;

  const PayLotteryState({
    this.paymentHistoryId=0,
    this.message = "",
    this.statusCode=0,
     this.total=0,
    this.tabIndex = -1,
    this.lotteryPayList = const [],
    this.lotteryType = "",
    this.state = PayLotteryConcrete.initial
  });

  const PayLotteryState.initial({
    this.paymentHistoryId=0,
    this.message = "",
    this.statusCode=0,
    this.total=0,
    this.tabIndex = -1,
  this.lotteryType = "",
    this.lotteryPayList = const [],
    this.state = PayLotteryConcrete.initial
});

  @override
  List<Object?> get props => [];

  PayLotteryState copyWith({
    int? paymentHistoryId,
    String? message,
    int? statusCode,
    int? total,
    int? tabIndex,
    String? lotteryType,
    List<OrderLotteryModel>? lotteryPayList,
    PayLotteryConcrete? state
}) => PayLotteryState(
      paymentHistoryId:paymentHistoryId??this.paymentHistoryId,
      message:message??this.message,
      statusCode:statusCode??this.statusCode,
      state:state??this.state,
    total:total??this.total,
      tabIndex: tabIndex??this.tabIndex,
      lotteryPayList: lotteryPayList??this.lotteryPayList,lotteryType:lotteryType??this.lotteryType);

}