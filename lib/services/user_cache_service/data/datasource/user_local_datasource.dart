import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/data/local/storage_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_model.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

abstract class UserDataSource {
  String get storageKey;

  Future<Either<AppException, User>> fetchUser();

  Future<bool> saveUser({required User user});

  Future<bool> hasUser();
  Future<bool> removeUser();
}

class UserLocalDataSource extends UserDataSource {
  final StorageService storageService;

  UserLocalDataSource(this.storageService);

  @override
  Future<Either<AppException, User>> fetchUser() async {
    final data = await storageService.get(storageKey);
    if (data == null) {
      return Left(AppException(
          message: 'ບໍ່ພົບຂໍ້ມູນຜູ້ໃຊ້',
          statusCode: 404,
          identifier: 'UserLocalDatasource'));
    }
    final userJson = jsonDecode(data.toString());
    return Right(User.fromJson(userJson));
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(storageKey);
  }

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

  @override
  Future<bool> saveUser({required User user}) async{
    return await storageService.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  Future<bool> removeUser() async {
    return await storageService.remove(storageKey);
  }
}
