import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/data/datasource/user_local_datasource.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, User>> fetchUser() {
    return dataSource.fetchUser();
  }

  @override
  Future<bool> hasUser() {
    return dataSource.hasUser();
  }

  @override
  Future<bool> saveUser({required User user}) {
    return dataSource.saveUser(user: user);
  }
}