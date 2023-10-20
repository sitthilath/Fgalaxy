import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/services/current_draw_lottery_cache_service/data/datasource/current_draw_lottery_local_datasource.dart';
import 'package:galaxy_18_lottery_app/services/current_draw_lottery_cache_service/domain/repository/current_draw_lottery_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/current_draw_lottery/current_draw_lottery_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class CurrentDrawLotteryCacheRepositoryImpl implements CurrentDrawLotteryCacheRepository{
  final CurrentDrawLotteryDatasource datasource;
  CurrentDrawLotteryCacheRepositoryImpl(this.datasource);
  @override
  Future<bool> checkCurrentDrawLottery() {
    return datasource.checkCurrentDrawLottery();
  }

  @override
  Future<Either<AppException, CurrentDrawLottery>> fetchCurrentDrawLottery() {
    return datasource.fetchCurrentDrawLottery();
  }

  @override
  Future<bool> removeCurrentDrawLottery() {
    return datasource.removeCurrentDrawLottery();
  }

  @override
  Future<bool> saveCurrentDrawLottery({required CurrentDrawLottery currentDrawLottery}) {
    return datasource.saveCurrentDrawLottery(currentDrawLottery: currentDrawLottery);
  }

}