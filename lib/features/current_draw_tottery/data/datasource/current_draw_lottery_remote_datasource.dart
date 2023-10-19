import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/data/datasource/current_draw_lottery_datasource.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/current_draw_lottery/current_draw_lottery_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/utils/url_constants.dart';

class CurrentDrawLotteryRemoteDatasource implements CurrentDrawLotteryDatasource{
  final NetworkService networkService;
  CurrentDrawLotteryRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, CurrentDrawLottery>> fetchCurrentDrawLottery() async {
    try{
      final response = await networkService.get(UrlConstants.CURRENT_DRAW_LOTTERY);
      return response.fold((l) => Left(l), (r){
        final currentDrawLotto = CurrentDrawLottery.fromJson(r.data);
        return Right(currentDrawLotto);
      });
    }catch(e){
      return Left(AppException(message: 'ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກຈາກການດືງຂໍ້ມູນງວດຫວຍ', statusCode: 0, identifier: '${e.toString()}\nCurrentDrawLotteryRemoteDatasource.fetchCurrentDrawLottery'));
    }
  }
}