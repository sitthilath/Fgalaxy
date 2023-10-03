import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

abstract class ForgotPasswordRepository {
  Future<Either<AppException, String>> forgotPassword(
      {required String phoneNumber});

  Future<Either<AppException, String>> resetPassword(
      {required String phoneNumber,
      required String code,
      required String newPassword});
}
