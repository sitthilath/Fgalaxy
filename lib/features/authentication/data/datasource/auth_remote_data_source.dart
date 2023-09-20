import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_form.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/utils/url_constants.dart';

abstract class LoginUserDataSource {
  Future<Either<AppException, User>> loginUser({required User user});
  Future<Either<AppException, User>> registerUser({required UserForm userForm});
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final NetworkService networkService;

  LoginUserRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, User>> loginUser({required User user}) async {
    try {
      final eitherType = await networkService.post(UrlConstants.LOGIN_PATH,
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

  @override
  Future<Either<AppException, User>> registerUser({required UserForm userForm}) async {
    try{
      final response = await networkService.post(UrlConstants.REGISTER_PATH,data: userForm.toJson());
      return response.fold((l) => Left(l), (r){
        final user = User.fromJson(r.data);
        return Right(user);
      });
    } catch (e) {
      return Left(AppException(message: 'ເກີດຄວາມຜິດພາດທີ່ບໍ່ຮູ້ຈັກ', statusCode: 1, identifier: '${e.toString()}\nLoginUserRemoteDataSource.registerUser'));
    }
  }
}
