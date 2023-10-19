import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/data/local/storage_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/current_draw_lottery/current_draw_lottery_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

abstract class CurrentDrawLotteryDatasource {
  Future<Either<AppException, CurrentDrawLottery>> fetchCurrentDrawLottery();

  Future<bool> saveCurrentDrawLottery(
      {required CurrentDrawLottery currentDrawLottery});

  Future<bool> checkCurrentDrawLottery();

  Future<bool> removeCurrentDrawLottery();

  String get storageKey;
}

class CurrentDrawLotteryLocalDatasource extends CurrentDrawLotteryDatasource {
  final StorageService storageService;

  CurrentDrawLotteryLocalDatasource(this.storageService);

  @override
  Future<bool> checkCurrentDrawLottery() async {
    return await storageService.has(storageKey);
  }

  @override
  Future<Either<AppException, CurrentDrawLottery>>
      fetchCurrentDrawLottery() async {
    final result = await storageService.get(storageKey);
    if (result == null) {
      return Left(AppException(
          message: 'ບໍ່ພົບຂໍ້ມູນງວດໃນແຄສ',
          statusCode: 0,
          identifier:
              'CurrentDrawLotteryLocalDatasource.fetchCurrentDrawLottery'));
    }
    final currentDrawLottery =
        CurrentDrawLottery.fromJson(jsonDecode(result.toString()));
    return Right(currentDrawLottery);
  }

  @override
  Future<bool> removeCurrentDrawLottery() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<bool> saveCurrentDrawLottery(
      {required CurrentDrawLottery currentDrawLottery}) async {
    return await storageService.set(
        storageKey, jsonEncode(currentDrawLottery.toJson()));
  }

  @override
  String get storageKey => CURRENT_DRAW_LOTTERY_KEY;
}
