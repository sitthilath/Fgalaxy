import 'package:dartz/dartz.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/data/datasource/forgot_password_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/domain/repository/forgot_password_repository.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  final ForgotPasswordDatasource datasource;

  ForgotPasswordRepositoryImpl(this.datasource);

  @override
  Future<Either<AppException, String>> forgotPassword(
      {required String phoneNumber}) {
    return datasource.forgotPassword(phoneNumber: phoneNumber);
  }

  @override
  Future<Either<AppException, String>> resetPassword(
      {required String phoneNumber,
      required String code,
      required String newPassword}) {
    return datasource.resetPassword(
        phoneNumber: phoneNumber, code: code, newPassword: newPassword);
  }
}
