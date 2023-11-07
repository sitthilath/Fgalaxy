import 'package:dartz/dartz.dart';

import '../../../../shared/domain/models/pay_lottery/pay_lottery_form.dart';
import '../../../../shared/domain/models/payment_history/payment_history_model.dart';
import '../../../../shared/exceptions/http_exception.dart';

abstract class PayLotteryRepository {
  Future<Either<AppException, PaymentHistory>> payLottery({required PayLotteryForm payLotteryForm});

}