import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/models/user/user_model.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;

  AuthNotifier({required this.authRepository, required this.userRepository})
      : super(const AuthState.initial());

  Future<void> loginUser(String username, String password) async {
    state = const AuthState.loading();
    final response = await authRepository.loginUser(
        user: User(username: username, password: password));
    state = await response.fold((failure) => AuthState.failure(failure),
        (user) async {
      final hasSaveUser = await userRepository.saveUser(user: user);
      print(" =======>$hasSaveUser");
      if (hasSaveUser) {
        return const AuthState.success();
      }
      return AuthState.failure(CacheFailureException());
    });
  }
}
