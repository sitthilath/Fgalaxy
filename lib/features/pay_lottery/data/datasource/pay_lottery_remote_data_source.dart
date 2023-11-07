
import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/pay_lottery/pay_lottery_form.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/payment_history/payment_history_model.dart';

import '../../../../shared/data/remote/network_service.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../../../../shared/utils/url_constants.dart';

abstract class PayLotteryDataSource {
  Future<Either<AppException, PaymentHistory>> payLottery({required PayLotteryForm payLotteryForm});
}

class PayLotteryRemoteDataSource implements PayLotteryDataSource {
  final NetworkService networkService;
  PayLotteryRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, PaymentHistory>> payLottery({required PayLotteryForm payLotteryForm}) async{
    try {
      final eitherType = await networkService.post(UrlConstants.PAY_LOTTERY_PATH,
          data: payLotteryForm.toJson());
      return eitherType.fold((exception) => Left(exception), (response) {
        final paymentHistory = PaymentHistory.fromJson(response.data);

        return right(paymentHistory);
      });
    } catch (e) {
      return Left(AppException(
          message: 'ເກີດຄວາມຜິດພາດທີ່ບໍ່ຮູ້ຈັກ',
          statusCode: 1,
          identifier: '${e.toString()}\PayLotteryRemoteDataSource.payLottery'));
    }
  }

}