import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/data/datasources/dream_treatise_datasource.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/domain/repository/dream_treatise_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/dream_treatise/dream_treatise_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class DreamTreatiseRepositoryImpl extends DreamTreatiseRepository{
  final DreamTreatiseDatasource datasource;
  DreamTreatiseRepositoryImpl(this.datasource);
  @override
  Future<Either<AppException, PaginatedResponse>> fetchAllDreamTreatises({required int cursor}) {
    return datasource.fetchAllDreamTreatises(cursor: cursor);
  }

  @override
  Future<Either<AppException, DreamTreatise>> fetchOneDreamTreatise({required int id}) {
    return datasource.fetchOneDreamTreatise(id: id);
  }

  @override
  Future<Either<AppException, PaginatedResponse>> searchDreamTreatises({required int cursor, required String query}) {
    return datasource.searchDreamTreatises(cursor: cursor, query: query);
  }

}