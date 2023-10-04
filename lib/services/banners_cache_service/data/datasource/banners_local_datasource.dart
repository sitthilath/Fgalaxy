import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/data/local/storage_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/banners/banner_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

abstract class BannersCacheDatasource {
  Future<Either<AppException, List<Banner>>> fetchAllBannersCache();
  Future<bool> saveBanners({required List<Banner> banners});
  Future<bool> hasBanner();
  Future<bool> deleteBanners();
  String get bannerKey;
}

class BannersLocalDatasource extends BannersCacheDatasource{
  final StorageService storageService;
  BannersLocalDatasource(this.storageService);

  @override
  Future<bool> deleteBanners() async {
    return await storageService.remove(bannerKey);
  }

  @override
  Future<Either<AppException, List<Banner>>> fetchAllBannersCache() async {
    final List<Banner> bannerList = [];
    final data = await storageService.get(bannerKey);
    if(data == null){
      return Left(AppException(message: 'ບໍ່ມີຂໍ້ມູນແບຣນເນີໃນແຄສ', statusCode: 0, identifier: 'BannersLocalDatasource.fetchAllBannersCache'));
    }
    final bannerJson = jsonDecode(data.toString());
    for(Map<String, dynamic> item in bannerJson){
      bannerList.add(Banner.fromJson(item));
    }
    return Right(bannerList);
  }

  @override
  Future<bool> hasBanner() async {
    return await storageService.has(bannerKey);
  }

  @override
  Future<bool> saveBanners({required List<Banner> banners}) async {
    return await storageService.set(bannerKey, jsonEncode(banners.toList()));
  }

  @override
  String get bannerKey => BANNER_LOCAL_STORAGE_KEY;
}