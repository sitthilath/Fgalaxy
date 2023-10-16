import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/data/datasource/lotteries_treatise_cache_datasource.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/domain/repository/lotteries_treatise_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/lotteries_treatise/lotteries_treatise_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class LotteriesTreatiseCacheRepositoryImpl implements LotteriesTreatiseCacheRepository{
  final LotteriesTreatiseCacheDatasource datasource;
  LotteriesTreatiseCacheRepositoryImpl(this.datasource);
  @override
  Future<Either<AppException, LotteriesTreatise>> fetchLotteriesTreatise() {
    return datasource.fetchLotteriesTreatise();
  }

  @override
  Future<bool> hasLotteriesTreatise() {
    return datasource.hasLotteriesTreatise();
  }

  @override
  Future<bool> removeLotteriesTreatise() {
    return datasource.removeLotteriesTreatise();
  }

  @override
  Future<bool> saveLotteriesTreatise({required List<LotteriesTreatise> lotteriesTreatise}) {
    return datasource.saveLotteriesTreatise(lotteriesTreatise: lotteriesTreatise);
  }

}