import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/lotteries_treatise/lotteries_treatise_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

abstract class LotteriesTreatiseCacheDatasource {
  Future<Either<AppException, List<LotteriesTreatise>>> fetchLotteriesTreatise();
  Future<bool> hasLotteriesTreatise();
  Future<bool> saveLotteriesTreatise({required List<LotteriesTreatise> lotteriesTreatise});
  Future<bool> removeLotteriesTreatise();
  String get storageLocalKey;
}