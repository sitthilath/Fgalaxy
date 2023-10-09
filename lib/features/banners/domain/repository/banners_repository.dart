import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/banners/banner_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

abstract class BannersRepository {
  Future<Either<AppException, PaginatedResponse>> fetchAllBanners();
}