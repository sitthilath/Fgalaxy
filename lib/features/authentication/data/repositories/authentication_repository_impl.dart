import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_form.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository{
  final LoginUserDataSource dataSource;
  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, User>> loginUser({required UserForm userForm}) {
    return dataSource.loginUser(userForm: userForm);
  }

  @override
  Future<Either<AppException, String>> registerUser({required UserForm userForm}) {
    return dataSource.registerUser(userForm: userForm);
  }

  @override
  Future<Either<AppException, String>> sendOTP({required UserForm phone}) {
    return dataSource.sendOTP(phone: phone);
  }

  @override
  Future<Either<AppException, User>> verifyOTP({required UserForm code}) {
    return dataSource.verifyOTP(code: code);
  }

  @override
  Future<Either<AppException, bool>> checkUser() {
    return dataSource.checkUser();
  }
}