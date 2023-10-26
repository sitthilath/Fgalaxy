import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_form.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

class OTPNotifier extends StateNotifier<AuthState>{
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;
  OTPNotifier(this.authRepository, this.userRepository): super(const AuthState.initial());

  Future<void> sendOTP(String phone) async {
    state = state.copyWith(
      state: AuthConcreteState.sendingOtp,
      isLoading: true,
    );
    final responseCode = await authRepository.sendOTP(
        phone: UserForm(phoneNumber: LA_PREFIX + phone));
    responseCode.fold((failure) {
      state = state.copyWith(
        state: AuthConcreteState.failure,
        message: failure.message,
        isLoading: false,
        statusCode: failure.statusCode,
      );
    }, (data) {
      if (data.isNotEmpty) {
        state = state.copyWith(
          state: AuthConcreteState.sentOtp,
          isLoading: false,
          statusCode: 200,
        );
      } else {
        state = state.copyWith(
          message: 'ການຂໍລະຫັດ OTP ຫຼົ່ມເຫຼວ',
          state: AuthConcreteState.failure,
          isLoading: false,
        );
      }
    });
  }

  Future<void> verifyUser(String code, String phone) async {
    state = state.copyWith(
      state: AuthConcreteState.verifying,
      isLoading: true,
    );
    final response = await authRepository.verifyOTP(
        code: UserForm(otpCode: code, phoneNumber: LA_PREFIX + phone));
    await response.fold((failure) {
      state = state.copyWith(
        state: AuthConcreteState.failure,
        message: failure.message,
        isLoading: false,
        statusCode: failure.statusCode,
      );
    },
            (user) async {
          final hasSaveUser = await userRepository.saveUser(user: user);
          if (hasSaveUser) {
            state = state.copyWith(
              state: AuthConcreteState.verified,
              isLoading: false,
              statusCode: 200,
            );
          } else {
            state = state.copyWith(
              state: AuthConcreteState.failure,
              isLoading: false,
              message: CacheFailureException().message,
            );
          }
        });
  }

  Future<void> verifyUserWithOTP(String phone, String code) async {
    state = state.copyWith(
      state: AuthConcreteState.verifyingWithOtp,
      isLoading: true,
    );

    final response = await authRepository.verifyLoginWithOTP(form: UserForm(otpCode: code, phoneNumber: LA_PREFIX+phone));
    response.fold((failure){
      state = state.copyWith(
        state: AuthConcreteState.failure,
        isLoading: false,
        message: failure.message,
        statusCode: failure.statusCode,
      );
    }, (data) async {
      final hasSaveUser = await userRepository.saveUser(user: data);
      if(hasSaveUser){
        state = state.copyWith(
          state: AuthConcreteState.verifiedWithOtp,
          isLoading: false,
          statusCode: 200,
        );
      }else{
        state = state.copyWith(
          state: AuthConcreteState.failure,
          isLoading: false,
          message: CacheFailureException().message,
        );
      }
    });
  }
}