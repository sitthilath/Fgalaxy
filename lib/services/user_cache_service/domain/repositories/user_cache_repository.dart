import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/models/user/user_model.dart';

abstract class UserRepository {
  Future<Either<AppException, User>> fetchUser();
  Future<bool> hasUser();
  Future<bool> saveUser({required User user});
}