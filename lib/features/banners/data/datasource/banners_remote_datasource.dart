import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/banners/banner_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/utils/url_constants.dart';

abstract class BannersDatasource {
  Future<Either<AppException, PaginatedResponse<Banner>>> fetchAllBanners();
}

class BannersRemoteDatasource implements BannersDatasource {
  final NetworkService networkService;
  BannersRemoteDatasource(this.networkService);
  @override
  Future<Either<AppException, PaginatedResponse<Banner>>> fetchAllBanners() async {
    try{
      final response = await networkService.get(UrlConstants.BANNERS_ADVERTISEMENT);
      return response.fold((failure) => Left(failure), (r){
        final jsonData = r.data;
        if(jsonData == null){
          return Left(AppException(message: 'data not found', statusCode: 0, identifier: 'fetchAllBanners'));
        }
        final List<Banner> bannerList = [];
        for(Map<String, dynamic> item in jsonData['data']){
          bannerList.add(Banner.fromJson(item));
        }
        final banners = PaginatedResponse<Banner>.fromJson(jsonData, bannerList ?? []);
        return Right(banners);
      });
    }catch(e){
      return Left(AppException(message: 'ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກ', statusCode: 1, identifier: '${e.toString()}\nBannersRemoteDatasource.fetchAllBanners'));
    }
  }

}