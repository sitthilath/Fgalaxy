import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/banners/banner_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

abstract class BannersCacheRepository{
  Future<Either<AppException, List<Banner>>> fetchAllBannersCache();
  Future<bool> saveBanners({required List<Banner> banners});
  Future<bool> hasBanner();
  Future<bool> deleteBanners();
}