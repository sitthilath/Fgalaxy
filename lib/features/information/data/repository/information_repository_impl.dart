import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/information/data/datasource/information_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/information/domain/repository/information_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class InformationRepositoryImpl extends InformationRepository{
  final InformationDatasource datasource;
  InformationRepositoryImpl(this.datasource);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchInformation({required int cursor}) {
    return datasource.fetchInformation(cursor: cursor);
  }
}