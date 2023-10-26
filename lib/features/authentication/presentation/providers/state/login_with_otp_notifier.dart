import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_form.dart';
import '../../../../../shared/globals.dart';

class LoginWithOTPNotifier extends StateNotifier<AuthState>{
  final AuthenticationRepository authRepository;
  LoginWithOTPNotifier({required this.authRepository}): super(const AuthState.initial());
  Future<void> loginWithOtp(String phone) async {
    state = state.copyWith(
      state: AuthConcreteState.signingWithOtp,
      isLoading: true,
    );
    final response = await authRepository.loginWithOTP(phone: UserForm(phoneNumber: LA_PREFIX + phone));
    response.fold((failure){
      state = state.copyWith(
        state: AuthConcreteState.failure,
        statusCode: failure.statusCode,
        message: failure.message,
        isLoading: false,
      );
    }, (data){
      if(data.isNotEmpty){
        state = state.copyWith(
          state: AuthConcreteState.signedWithOtp,
          statusCode: 200,
          isLoading: false,
        );
      }
    });
  }
}