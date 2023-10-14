import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_form.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, User>> loginUser({required UserForm userForm});
  Future<Either<AppException, String>> registerUser({required UserForm userForm});
  Future<Either<AppException, String>> sendOTP({required UserForm phone});
  Future<Either<AppException, User>> verifyOTP({required UserForm code});
  Future<Either<AppException, bool>> checkUser();
  Future<Either<AppException, String>> loginWithOTP({required UserForm phone});
  Future<Either<AppException, User>> verifyLoginWithOTP({required UserForm form});
  Future<Either<AppException, String>> logout();
}
