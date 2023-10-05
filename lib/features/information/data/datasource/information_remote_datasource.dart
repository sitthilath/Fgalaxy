import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/utils/url_constants.dart';

abstract class InformationDatasource {
  Future<Either<AppException, PaginatedResponse>> fetchInformation({required int cursor});
}

class InformationRemoteDatasource implements InformationDatasource{
  final NetworkService networkService;
  InformationRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchInformation({required int cursor}) async {
    try{
      final response = await networkService.get(UrlConstants.NEWS_ADVERTISEMENT, query: {
        'cursor': cursor,
        'page_size': LIMIT_PAGE_SIZE,
      });
      return await response.fold((l) => Left(l), (r)async {
        final jsonData = r.data;
        if(jsonData == null){
          return Left(AppException(message: 'The data is not in the valid format.', statusCode: 0, identifier: 'fetchInformation'));
        }
        final responseJson = PaginatedResponse.fromJson(jsonData, jsonData['data']);
        return Right(responseJson);
      });
    }catch(e){
      return Left(AppException(message: 'ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກ', statusCode: 1, identifier: '${e.toString()}\nInformationRemoteDatasource.fetchInformation'));
    }
  }

}