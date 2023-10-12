import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/dream_treatise/dream_treatise_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

abstract class DreamTreatiseDatasource {
  Future<Either<AppException, PaginatedResponse>> fetchAllDreamTreatises(
      {required int cursor});

  Future<Either<AppException, PaginatedResponse>> searchDreamTreatises(
      {required int cursor, required String query});

  Future<Either<AppException, DreamTreatise>> fetchOneDreamTreatise(
      {required int id});
}
