import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/services/banners_cache_service/data/datasource/banners_local_datasource.dart';
import 'package:galaxy_18_lottery_app/services/banners_cache_service/domain/repository/banners_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/banners/banner_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class BannersCacheRepositoryImpl extends BannersCacheRepository{
  final BannersCacheDatasource datasource;
  BannersCacheRepositoryImpl(this.datasource);
  @override
  Future<bool> deleteBanners() {
    return datasource.deleteBanners();
  }

  @override
  Future<Either<AppException, List<Banner>>> fetchAllBannersCache() {
    return datasource.fetchAllBannersCache();
  }

  @override
  Future<bool> hasBanner() {
    return datasource.hasBanner();
  }

  @override
  Future<bool> saveBanners({required List<Banner> banners}) {
    return datasource.saveBanners(banners: banners);
  }

}