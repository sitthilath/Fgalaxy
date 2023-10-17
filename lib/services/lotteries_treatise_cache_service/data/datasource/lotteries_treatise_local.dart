import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/data/datasource/lotteries_treatise_cache_datasource.dart';
import 'package:galaxy_18_lottery_app/shared/data/local/storage_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/lotteries_treatise/lotteries_treatise_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

class LotteriesTreatiseLocal implements LotteriesTreatiseCacheDatasource{
  final StorageService storageService;
  LotteriesTreatiseLocal(this.storageService);

  @override
  Future<Either<AppException, List<LotteriesTreatise>>> fetchLotteriesTreatise() async {
    final data = await storageService.get(storageLocalKey);
    if(data == null){
      return Left(AppException(message: 'ບໍ່ພົບຕຳລາຫວຍໃນແຄສ', statusCode: 0, identifier: 'LotteriesTreatiseLocal.fetchLotteriesTreatise'));
    }
    final jsonData = jsonDecode(data.toString());
    final List<LotteriesTreatise> lotteriesTreatiseList = [];
    for(Map<String, dynamic> json in jsonData){
      lotteriesTreatiseList.add(LotteriesTreatise.fromJson(json));
    }
    return Right(lotteriesTreatiseList);
  }

  @override
  Future<bool> hasLotteriesTreatise() async {
    return await storageService.has(storageLocalKey);
  }

  @override
  Future<bool> removeLotteriesTreatise() async {
    return await storageService.remove(storageLocalKey);
  }

  @override
  Future<bool> saveLotteriesTreatise({required List<LotteriesTreatise> lotteriesTreatise}) async {
    final lotteriesTreatiseList = lotteriesTreatise.map((e) => e.toJson()).toList();
    return await storageService.set(storageLocalKey, jsonEncode(lotteriesTreatiseList));
  }

  @override
  String get storageLocalKey => LOTTERIES_TREATISE_STORAGE_KEY;
}