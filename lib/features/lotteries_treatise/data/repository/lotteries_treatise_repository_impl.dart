import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/lotteries_treatise/data/datasource/lotteries_treatise_datasource.dart';
import 'package:galaxy_18_lottery_app/features/lotteries_treatise/domain/repository/lottery_treatise_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class LotteriesTreatiseRepositoryImpl implements LotteriesTreatiseRepository{
  final LotteriesTreatiseDatasource datasource;
  LotteriesTreatiseRepositoryImpl(this.datasource);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchAllLotteriesTreatise() {
    return datasource.fetchAllLotteriesTreatise();
  }
}