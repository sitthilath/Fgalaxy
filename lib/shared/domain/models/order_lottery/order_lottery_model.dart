import 'package:equatable/equatable.dart';

class OrderLotteryModel extends Equatable{

  final int? id;
  final String? digit;
  final int? amount;

  const OrderLotteryModel(
      {
        required this.id,
        required this.digit,
        required this.amount
      });

  @override
  List<Object?> get props => [id,digit,amount];

  OrderLotteryModel copyWith({
    int? id,
    String? digit,
    int? amount,
  }) {
    return OrderLotteryModel(
      id: id ?? this.id,
      digit: digit ?? this.digit,
      amount: amount ?? this.amount,
    );
  }

}



