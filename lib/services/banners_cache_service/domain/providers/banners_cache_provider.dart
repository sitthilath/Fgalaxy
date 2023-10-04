import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/services/banners_cache_service/data/datasource/banners_local_datasource.dart';
import 'package:galaxy_18_lottery_app/services/banners_cache_service/data/repository/banners_cache_repository_impl.dart';
import 'package:galaxy_18_lottery_app/services/banners_cache_service/domain/repository/banners_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/local/storage_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/sharedpreferance_storage_service.dart';

final bannersCacheDatasourceProvider = Provider.family<BannersCacheDatasource, StorageService>((_, storageService) => BannersLocalDatasource(storageService));
final bannersCacheRepositoryProvider = Provider<BannersCacheRepository>((ref) {
  final StorageService storageService = ref.watch(storageServiceProvider);
  final BannersCacheDatasource datasource = ref.watch(bannersCacheDatasourceProvider(storageService));
  return BannersCacheRepositoryImpl(datasource);
});