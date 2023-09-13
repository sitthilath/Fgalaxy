import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/models/user/user_model.dart';
import 'package:galaxy_18_lottery_app/shared/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/utils/url_constants.dart';

abstract class LoginUserDataSource {
  Future<Either<AppException, User>> loginUser({required User user});
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final NetworkService networkService;

  LoginUserRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, User>> loginUser({required User user}) async {
    try {
      final eitherType = await networkService.post(UrlConstants.loginPath,
          data: user.toJson());
      return eitherType.fold((exception) => Left(exception), (response) {
        final user = User.fromJson(response.data);
        networkService.updateHeader({'Authorization': user.token});
        return right(user);
      });
    } catch (e) {
      return Left(AppException(
          message: 'ເກີດຄວາມຜິດພາດທີ່ບໍ່ຮູ້ຈັກ',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser'));
    }
  }
}
