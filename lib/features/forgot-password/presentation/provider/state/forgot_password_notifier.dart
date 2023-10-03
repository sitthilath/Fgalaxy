import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/domain/repository/forgot_password_repository.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/state/forgot_password_state.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

class ForgotPasswordStateNotifier extends StateNotifier<ForgotPasswordState> {
  final ForgotPasswordRepository forgotPasswordRepository;

  ForgotPasswordStateNotifier({required this.forgotPasswordRepository})
      : super(const ForgotPasswordState.initial());

  Future<void> forgotPassword(String phoneNumber) async {
    state = const ForgotPasswordState.loading();
    final response = await forgotPasswordRepository.forgotPassword(phoneNumber: LA_PREFIX+phoneNumber);
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
    final response = await forgotPasswordRepository.resetPassword(phoneNumber: LA_PREFIX+phoneNumber, code: code, newPassword: password);
    state = await response.fold((failure) {
      return ForgotPasswordState.failure(failure);
    }, (r) => const ForgotPasswordState.success());
  }
}
