import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/data/datasources/dream_treatise_datasource.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/dream_treatise/dream_treatise_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/utils/url_constants.dart';

class DreamTreatiseRemoteDatasource implements DreamTreatiseDatasource {
  final NetworkService networkService;

  DreamTreatiseRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchAllDreamTreatises(
      {required int cursor}) async {
    try {
      final response =
          await networkService.get(UrlConstants.DREAM_TREATISE, query: {
        'page_size': LIMIT_PAGE_SIZE,
        'cursor': cursor,
      });
      return await response.fold((failure) => Left(failure), (r) {
        final jsonResponse = r.data;
        if (jsonResponse == null) {
          return Left(AppException(
              message: 'The data is not in the valid format.',
              statusCode: 0,
              identifier: 'fetchAllDreamTreatises'));
        }
        final dreamTreatiseResponse =
            PaginatedResponse.fromJson(jsonResponse, jsonResponse['data']);
        return Right(dreamTreatiseResponse);
      });
    } catch (e) {
      return Left(AppException(
          message: 'ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກ',
          statusCode: 0,
          identifier:
              '${e.toString()}\nDreamTreatiseRemoteDatasource.fetchAllDreamTreatises'));
    }
  }

  @override
  Future<Either<AppException, DreamTreatise>> fetchOneDreamTreatise(
      {required int id}) async {
    try {
      final response =
          await networkService.get('${UrlConstants.DREAM_TREATISE}/$id');
      return await response.fold((failure) => Left(failure), (r) {
        final jsonResponse = r.data;
        if (jsonResponse == null) {
          return Left(AppException(
              message: 'The data is not in the valid format.',
              statusCode: 0,
              identifier: 'fetchOneDreamTreatise'));
        }
        final dreamTreatiseResponse = DreamTreatise.fromJson(jsonResponse);
        return Right(dreamTreatiseResponse);
      });
    } catch (e) {
      return Left(AppException(
          message: 'ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກ',
          statusCode: 0,
          identifier:
              '${e.toString()}\nDreamTreatiseRemoteDatasource.fetchOneDreamTreatise'));
    }
  }

  @override
  Future<Either<AppException, PaginatedResponse>> searchDreamTreatises(
      {required int cursor, required String query}) async {
    try {
      final response =
          await networkService.get(UrlConstants.DREAM_TREATISE, query: {
        'page_size': LIMIT_PAGE_SIZE,
        'cursor': cursor,
        'search': query,
      });
      return await response.fold((failure) => Left(failure), (r) {
        final jsonResponse = r.data;
        if (jsonResponse == null) {
          return Left(AppException(
              message: 'The data is not in the valid format.',
              statusCode: 0,
              identifier: 'searchDreamTreatises'));
        }
        final dreamTreatiseResponse =
            PaginatedResponse.fromJson(jsonResponse, jsonResponse['data']);
        return Right(dreamTreatiseResponse);
      });
    } catch (e) {
      return Left(AppException(
          message: 'ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກ',
          statusCode: 0,
          identifier:
              '${e.toString()}\nDreamTreatiseRemoteDatasource.searchDreamTreatises'));
    }
  }
}
