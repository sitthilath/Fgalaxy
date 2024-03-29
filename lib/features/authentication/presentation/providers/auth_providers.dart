import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/providers/login_provider.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_notifier.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/login_with_otp_notifier.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/otp_notifier.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/repositories/user_cache_repository.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final AuthenticationRepository authenticationRepository =
      ref.watch(authRepositoryProvider);
  final UserRepository userRepository = ref.watch(userLocalRepositoryProvider);
  return AuthNotifier(
      authRepository: authenticationRepository, userRepository: userRepository);
});

final loginWithOtpStateNotifierProvider = StateNotifierProvider<LoginWithOTPNotifier, AuthState>((ref){
  final AuthenticationRepository authenticationRepository =
  ref.watch(authRepositoryProvider);
  return LoginWithOTPNotifier(authRepository: authenticationRepository);
});

final otpStateNotifierProvider = StateNotifierProvider<OTPNotifier, AuthState>((ref){
  final AuthenticationRepository authenticationRepository =
  ref.watch(authRepositoryProvider);
  final UserRepository userRepository = ref.watch(userLocalRepositoryProvider);
  return OTPNotifier(authenticationRepository, userRepository);
});
