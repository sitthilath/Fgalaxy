import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/current_draw_lottery/current_draw_lottery_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

abstract class CurrentDrawLotteryRepository{
  Future<Either<AppException, CurrentDrawLottery>> fetchCurrentDrawLottery();
}