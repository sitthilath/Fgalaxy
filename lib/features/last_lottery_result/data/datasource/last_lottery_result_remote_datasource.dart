import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/last_lottery_result/last_lottery_result_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/utils/url_constants.dart';

abstract class LastLotteryResultDatasource {
  Future<Either<AppException, LastLotteryResult>> getLastLotteryResult();
}

class LastLotteryResultRemoteDatasource extends LastLotteryResultDatasource{
  final NetworkService networkService;
  LastLotteryResultRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, LastLotteryResult>> getLastLotteryResult() async {
    try{
      final response = await networkService.get(UrlConstants.LAST_LOTTERY_RESULT);
      return response.fold((l) => Left(l), (r){
        final lastLotteryResult = LastLotteryResult.fromJson(r.data);
        return Right(lastLotteryResult);
      });
    }catch(e){
      return Left(AppException(message: 'ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກ', statusCode: 0, identifier: '${e.toString()}\nLastLotteryResultRemoteDatasource.getLastLotteryResult'));
    }
  }

}
