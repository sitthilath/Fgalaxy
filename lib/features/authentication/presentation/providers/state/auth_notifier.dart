import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/configs/app_configs.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_form.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;

  AuthNotifier({required this.authRepository, required this.userRepository})
      : super(const AuthState.initial());

  Future<void> registerUser(String phone, String password) async {
    state = const AuthState.signing();
    final response = await authRepository.registerUser(
        userForm: UserForm(phoneNumber: AppConfigs.LA_PREFIX+phone, password: password));
    state = await response.fold((failure) => AuthState.failure(failure), (r) async {
        if(r.isNotEmpty){
          return const AuthState.signed();
        }
      return AuthState.failure(CacheFailureException());
    });
  }

  Future<void> sendOTP(String phone) async {
    state = const AuthState.signingCode();
    final responseCode = await authRepository.sendOTP(phone: UserForm(phoneNumber: AppConfigs.LA_PREFIX+phone));
    state = responseCode.fold((failure){
      return AuthState.failure(failure);
    }, (r) {
      if (r.isNotEmpty) {
        return const AuthState.signedCode();
      }
      return AuthState.failure(AppException(
          message: 'ການຂໍລະຫັດ OTP ຫຼົ່ມເຫຼວ',
          statusCode: 0,
          identifier: 'AuthNotifier.sendOTP'));
    });
  }
  Future<void> verifyUser(String code, String phone) async {
    state = const AuthState.verifying();
    final response = await authRepository.verifyOTP(code: UserForm(otpCode: code, phoneNumber: AppConfigs.LA_PREFIX+phone));
    state = await response.fold((failure) => AuthState.failure(failure), (user) async {
        final hasSaveUser = await userRepository.saveUser(user: user);
        if(hasSaveUser){
          return const AuthState.verified();
        }
        return AuthState.failure(CacheFailureException());
    });
  }

  Future<void> loginUser(String phone, String password) async {
    state = const AuthState.signing();
    final response = await authRepository.loginUser(userForm: UserForm(phoneNumber: AppConfigs.LA_PREFIX+phone, password: password));
    state = await response.fold((failure) => AuthState.failure(failure), (user)async {
      final hasSaveUser = await userRepository.saveUser(user: user);
      if(hasSaveUser){
        return const AuthState.signed();
      }
      return AuthState.failure(CacheFailureException());
    });
  }
}
