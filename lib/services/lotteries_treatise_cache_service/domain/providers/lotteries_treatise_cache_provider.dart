import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/data/datasource/lotteries_treatise_cache_datasource.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/data/datasource/lotteries_treatise_local.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/data/repository/lotteries_treatise_cache_repository_impl.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/domain/repository/lotteries_treatise_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/local/storage_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/sharedpreferance_storage_service.dart';

final lotteriesTreatiseCacheDatasourceProvider = Provider.family<LotteriesTreatiseCacheDatasource, StorageService>((_, storageService) => LotteriesTreatiseLocal(storageService));

final lotteriesTreatiseCacheRepositoryProvider = Provider<LotteriesTreatiseCacheRepository>((ref) {
  final StorageService storageService = ref.watch(storageServiceProvider);
  final LotteriesTreatiseCacheDatasource datasource = ref.watch(lotteriesTreatiseCacheDatasourceProvider(storageService));
  final repository = LotteriesTreatiseCacheRepositoryImpl(datasource);
  return repository;
});