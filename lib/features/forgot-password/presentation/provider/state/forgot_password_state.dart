import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
part 'forgot_password_state.freezed.dart';
@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = Initial;
  const factory ForgotPasswordState.loading() = Loading;
  const factory ForgotPasswordState.hasPhone() = HasPhone;
  const factory ForgotPasswordState.notFoundPhone() = NotFoundPhone;
  const factory ForgotPasswordState.success() = Success;
  const factory ForgotPasswordState.failure(AppException exception) = Failure;
}