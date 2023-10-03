import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/features/splash/presentation/providers/state/splash_state.dart';
import 'package:galaxy_18_lottery_app/infrastructure/notification/firebase_notification.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

class SplashNotifier extends StateNotifier<SplashAppState> {
  final FirebaseNotification firebaseService;
  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;
  final NetworkService networkService;

  SplashNotifier(
      {required this.firebaseService,
      required this.userRepository,
      required this.authenticationRepository,
      required this.networkService})
      : super(const SplashAppState.initial());

  Future<void> initialApp() async {
    state = const SplashAppState.loading();
    final hasInternetConnection = await checkingInternet();
    if (!hasInternetConnection) {
      state = const SplashAppState.noInternet();
      return;
    }
    final invalidUser = await checkingUserLoggedIn();
    if (!invalidUser) {
      state = const SplashAppState.invalidToken();
      return;
    }
    await firebaseService.initialise();
    state = const SplashAppState.accepted();
  }

  Future<bool> checkingUserLoggedIn() async {
    final hasUser = await userRepository.hasUser();
    if (hasUser) {
      final user = await userRepository.fetchUser();
      user.fold((l) => false, (r) async {
        networkService.updateHeader({'Authorization':TOKEN_TYPE+r.accessToken});
      });
      final response = await authenticationRepository.checkUser();
      return response.fold((l) => false, (r) => true);
    } else {
      return false;
    }
  }

  Future<bool> checkingInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  set context(BuildContext context) {
    firebaseService.context = context;
  }
}
