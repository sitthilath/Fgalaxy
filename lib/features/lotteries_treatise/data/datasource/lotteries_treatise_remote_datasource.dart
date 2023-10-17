import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/lotteries_treatise/data/datasource/lotteries_treatise_datasource.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/utils/url_constants.dart';

class LotteriesTreatiseRemoteDatasource implements LotteriesTreatiseDatasource{
  final NetworkService networkService;
  LotteriesTreatiseRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchAllLotteriesTreatise() async {
    try{
      final response = await networkService.get(UrlConstants.LOTTERIES_TREATISE);
      return response.fold((l) => Left(l), (r){
        final jsonData = r.data;
        if(jsonData == null){
          return Left(AppException(message: 'ຂໍ້ມູນບໍ່ຢູ່ໃນຮູບແບບທີ່ຖືກຕ້ອງ.', statusCode: 0, identifier: 'fetchAllLotteriesTreatise'));
        }
        final lotteriesTreatiseResponse = PaginatedResponse.fromJson(jsonData, jsonData['data']);
        return Right(lotteriesTreatiseResponse);
      });
    }catch(e){
      return Left(AppException(message: 'ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກໃນການດຶງຂໍ້ມູນຕຳລາຫວຍ', statusCode: 0, identifier: '${e.toString()}\nLotteriesTreatiseRemoteDatasource.fetchAllLotteriesTreatise'));
    }
  }

}