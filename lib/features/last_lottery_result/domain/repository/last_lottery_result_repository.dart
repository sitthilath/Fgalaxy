import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/last_lottery_result/last_lottery_result_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

abstract class LastLotteryResultRepository {
  Future<Either<AppException, LastLotteryResult>> getLastLotteryResult();
}