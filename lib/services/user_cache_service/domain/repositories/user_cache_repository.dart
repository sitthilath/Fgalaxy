import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

abstract class UserRepository {
  Future<Either<AppException, User>> fetchUser();
  Future<bool> hasUser();
  Future<bool> saveUser({required User user});
  Future<bool> removeUser();
}