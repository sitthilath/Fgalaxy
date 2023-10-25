import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/domain/repository/forgot_password_repository.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/state/forgot_password_state.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

class ResetPasswordNotifier extends StateNotifier<ForgotPasswordState>{
  final ForgotPasswordRepository repository;
  ResetPasswordNotifier({required this.repository}): super(const ForgotPasswordState.initial());

  Future<void> resendOTP(String phone) async {
    state = const ForgotPasswordState.loading();
    final response = await repository.forgotPassword(phoneNumber: LA_PREFIX+phone);
    state = await response.fold((failure){
      if(failure.statusCode == 404){
        return const ForgotPasswordState.notFoundPhone();
      }
      return ForgotPasswordState.failure(failure);
    }, (r) {
      return const ForgotPasswordState.hasPhone();
    });
  }

  Future<void> resetPassword(String phoneNumber, String code, String password) async {
    state = const ForgotPasswordState.loading();
    final response = await repository.resetPassword(phoneNumber: LA_PREFIX+phoneNumber, code: code, newPassword: password);
    state = await response.fold((failure) {
      return ForgotPasswordState.failure(failure);
    }, (r) => const ForgotPasswordState.success());
  }

}