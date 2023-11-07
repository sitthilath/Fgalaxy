import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/pay_lottery/data/datasource/pay_lottery_remote_data_source.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/pay_lottery/pay_lottery_form.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/payment_history/payment_history_model.dart';

import '../../../../shared/exceptions/http_exception.dart';
import '../../domain/repositories/pay_lottery_repository.dart';

class PayLotteryRepositoryImpl extends PayLotteryRepository {
  final PayLotteryDataSource dataSource;

  PayLotteryRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, PaymentHistory>> payLottery({required PayLotteryForm payLotteryForm}) {
    return dataSource.payLottery(payLotteryForm: payLotteryForm);
  }
}