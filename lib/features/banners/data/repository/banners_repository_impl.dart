import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/banners/data/datasource/banners_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/banners/domain/repository/banners_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class BannersRepositoryImpl extends BannersRepository{
  final BannersDatasource datasource;
  BannersRepositoryImpl(this.datasource);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchAllBanners() {
    return datasource.fetchAllBanners();
  }

}