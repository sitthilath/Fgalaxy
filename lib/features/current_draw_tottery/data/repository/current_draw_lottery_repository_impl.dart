import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/data/datasource/current_draw_lottery_datasource.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/domain/repository/current_draw_lottery_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/current_draw_lottery/current_draw_lottery_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class CurrentDrawLotteryRepositoryImpl implements CurrentDrawLotteryRepository{
  final CurrentDrawLotteryDatasource datasource;
  CurrentDrawLotteryRepositoryImpl(this.datasource);
  @override
  Future<Either<AppException, CurrentDrawLottery>> fetchCurrentDrawLottery() {
    return datasource.fetchCurrentDrawLottery();
  }

}