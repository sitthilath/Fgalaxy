import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/models/user/user_model.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository{
  final LoginUserDataSource dataSource;
  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, User>> loginUser({required User user}) {
    return dataSource.loginUser(user: user);
  }

}