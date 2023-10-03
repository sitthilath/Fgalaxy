import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/utils/url_constants.dart';

abstract class ForgotPasswordDatasource {
  Future<Either<AppException, String>> forgotPassword(
      {required String phoneNumber});

  Future<Either<AppException, String>> resetPassword(
      {required String phoneNumber,
      required String code,
      required String newPassword});
}

class ForgotPasswordRemoteDatasource implements ForgotPasswordDatasource {
  final NetworkService networkService;

  ForgotPasswordRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, String>> forgotPassword(
      {required String phoneNumber}) async {
    try {
      final response = await networkService.post(UrlConstants.FORGOT_PASSWORD, data: {
        'phone': phoneNumber
      });
      return response.fold((l) => Left(l), (r) => Right(r.data));
    } catch (e) {
      return Left(
        AppException(
          message: 'ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກ',
          statusCode: 1,
          identifier: '${e.toString()}\nForgotPasswordRemoteDatasource.forgotPassword',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, String>> resetPassword(
      {required String phoneNumber,
      required String code,
      required String newPassword}) async {
      try{
        final response = await networkService.post(UrlConstants.RESET_PASSWORD, data: {
          'phone': phoneNumber,
          'code': code,
          'new_password': newPassword,
        });
        return response.fold((l) => Left(l), (r) => Right(r.data));
      }catch (e){
        return Left(AppException(message: "ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກ", statusCode: 1, identifier: "${e.toString()}\nForgotPasswordRemoteDatasource.resetPassword"));
      }
  }
}
