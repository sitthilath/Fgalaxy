import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/data/datasource/last_lottery_result_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/domain/repository/last_lottery_result_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/last_lottery_result/last_lottery_result_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class LastLotteryResultRepositoryImpl implements LastLotteryResultRepository{
  final LastLotteryResultDatasource datasource;
  LastLotteryResultRepositoryImpl(this.datasource);

  @override
  Future<Either<AppException, LastLotteryResult>> getLastLotteryResult() {
    return datasource.getLastLotteryResult();
  }

}