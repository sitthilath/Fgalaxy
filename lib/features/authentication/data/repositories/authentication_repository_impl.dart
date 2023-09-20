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
  Future<Either<AppException, User>> loginUser({required User user}) {
    return dataSource.loginUser(user: user);
  }

  @override
  Future<Either<AppException, User>> registerUser({required UserForm userForm}) {
    return dataSource.registerUser(userForm: userForm);
  }
}