import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/services/current_draw_lottery_cache_service/data/datasource/current_draw_lottery_local_datasource.dart';
import 'package:galaxy_18_lottery_app/services/current_draw_lottery_cache_service/data/repository/current_draw_lottery_cache_repository_impl.dart';
import 'package:galaxy_18_lottery_app/services/current_draw_lottery_cache_service/domain/repository/current_draw_lottery_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/local/storage_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/sharedpreferance_storage_service.dart';

final currentDrawLotteryCacheDatasourceProvider = Provider.family<CurrentDrawLotteryDatasource, StorageService>((_, storageService) => CurrentDrawLotteryLocalDatasource(storageService));
final currentDrawLotteryCacheRepoProvider = Provider<CurrentDrawLotteryCacheRepository>((ref){
  final StorageService storageService = ref.watch(storageServiceProvider);
  final CurrentDrawLotteryDatasource datasource = ref.watch(currentDrawLotteryCacheDatasourceProvider(storageService));
  return CurrentDrawLotteryCacheRepositoryImpl(datasource);
});