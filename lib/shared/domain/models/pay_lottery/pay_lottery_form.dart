
import 'package:equatable/equatable.dart';

class PayLotteryForm extends Equatable {
  final int paymentTypeId;
  final List<Lottery> lotteries;
  final String lotteryType;

  const PayLotteryForm(
      {
        this.paymentTypeId = 1,
        this.lotteries = const [],
        this.lotteryType = ''});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lottery_type': lotteryType,
      'lotteries': lotteries,
      "payment_type_id":paymentTypeId
    };
  }

  @override
  List<Object?> get props => [];
}

class Lottery {
  final int amount;
  final String lottoNumber;

  const Lottery(
      {
        this.amount = 0,
        this.lottoNumber = '',});

}