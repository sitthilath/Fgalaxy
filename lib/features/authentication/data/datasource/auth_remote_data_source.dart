import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_form.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/utils/url_constants.dart';

abstract class LoginUserDataSource {

  Future<Either<AppException, User>> loginUser({required UserForm userForm});

  Future<Either<AppException, String>> registerUser(
      {required UserForm userForm});

  Future<Either<AppException, String>> sendOTP({required UserForm phone});

  Future<Either<AppException, User>> verifyOTP({required UserForm code});

  Future<Either<AppException, bool>> checkUser();

  Future<Either<AppException, String>> loginWithOTP({required UserForm phone});

  Future<Either<AppException, User>> verifyLoginWithOTP(
      {required UserForm form});

  Future<Either<AppException, String>> logout();
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final NetworkService networkService;

  LoginUserRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, User>> loginUser(
      {required UserForm userForm}) async {
    try {
      final eitherType = await networkService.post(UrlConstants.LOGIN_PATH,
          data: userForm.toJson());
      return eitherType.fold((exception) => Left(exception), (response) {
        final user = User.fromJson(response.data);
        networkService
            .updateHeader({'Authorization': TOKEN_TYPE + user.accessToken});
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
  Future<Either<AppException, String>> registerUser(
      {required UserForm userForm}) async {
    try {
      final response = await networkService.post(UrlConstants.REGISTER_PATH,
          data: userForm.toJson());
      return response.fold((l) {
        return Left(l);
      }, (r) {
        final message = r.data;
        return Right(message);
      });
    } catch (e) {
      return Left(AppException(
          message: 'ເກີດຄວາມຜິດພາດທີ່ບໍ່ຮູ້ຈັກຈາກການລົງທະບຽນ',
          statusCode: 0,
          identifier:
              '${e.toString()}\nLoginUserRemoteDataSource.registerUser'));
    }
  }

  @override
  Future<Either<AppException, String>> sendOTP(
      {required UserForm phone}) async {
    try {
      final response = await networkService.post(UrlConstants.SEND_OTP_PATH,
          data: phone.phoneToJson());
      return response.fold((l) => Left(l), (r) {
        final message = r.data;
        return Right(message);
      });
    } catch (e) {
      return Left(AppException(
          message: 'ເກີດຄວາມຜິດພາດທີ່ບໍ່ຮູ້ຈັກຈາກການສົ່ງລະຫັດ OTP',
          statusCode: 1,
          identifier: 'LoginUserRemoteDataSource.sendOTP'));
    }
  }

  @override
  Future<Either<AppException, User>> verifyOTP({required UserForm code}) async {
    try {
      final response = await networkService.post(UrlConstants.OVERIFY_OTP,
          data: code.verifyToJson());
      return response.fold((l) => Left(l), (r) {
        final user = User.fromJson(r.data);
        networkService
            .updateHeader({'Authorization': TOKEN_TYPE + user.accessToken});
        return Right(user);
      });
    } catch (e) {
      return Left(AppException(
          message: 'ເກີດຄວາມຜິດພາດທີ່ບໍ່ຮູ້ຈັກຈາກການຢືນຢັນລະຫັດ OTP',
          statusCode: 1,
          identifier: 'LoginUserRemoteDataSource.verifyOTP: $e'));
    }
  }

  @override
  Future<Either<AppException, bool>> checkUser() async {
    try {
      final response = await networkService.get(UrlConstants.USER_PROFILE);
      return response.fold((l) => Left(l), (r) {
        if (r.statusCode == 200) {
          return const Right(true);
        }
        return Left(AppException(
            message: 'ບໍ່ມີຂໍ້ມູນ',
            statusCode: 1,
            identifier: "no response!!"));
      });
    } catch (e) {
      return Left(AppException(
          message: 'Invalid Token',
          statusCode: 1,
          identifier: "CheckUser: $e"));
    }
  }

  @override
  Future<Either<AppException, String>> loginWithOTP(
      {required UserForm phone}) async {
    try {
      final response = await networkService.post(UrlConstants.LOGIN_WITH_OTP,
          data: phone.phoneToJson());
      return response.fold((l) => Left(l), (r) => Right(r.data.toString()));
    } catch (e) {
      return Left(AppException(
          message: 'ເກີດຄວາມຜິດພາດທີ່ບໍ່ຮູ້ຈັກ',
          statusCode: 0,
          identifier:
              '${e.toString()}\nLoginUserRemoteDataSource.loginWithOtp'));
    }
  }

  @override
  Future<Either<AppException, User>> verifyLoginWithOTP(
      {required UserForm form}) async {
    try {
      final response = await networkService.post(UrlConstants.VERIFY_LOGIN_OTP,
          data: form.verifyToJson());
      return response.fold((l) => Left(l), (r) {
        final user = User.fromJson(r.data);
        networkService
            .updateHeader({'Authorization': TOKEN_TYPE + user.accessToken});
        return Right(user);
      });
    } catch (e) {
      return Left(AppException(
          message: 'ເກີດຄວາມຜິດພາດທີ່ບໍ່ຮູ້ຈັກ',
          statusCode: 0,
          identifier:
              '${e.toString()}\nLoginUserRemoteDataSource.verifyLoginWithOTP'));
    }
  }

  @override
  Future<Either<AppException, String>> logout() async {
    try{
      final response = await networkService.get(UrlConstants.LOGOUT);
      return response.fold((l) => Left(l), (r) => Right(r.data));
    }catch(e){
      return Left(AppException(message: 'ເກີດຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກ', statusCode: 0, identifier: '${e.toString()}\nLoginUserRemoteDataSource.logout'));
    }
  }
}
