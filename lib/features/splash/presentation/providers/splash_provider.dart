import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/providers/login_provider.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/features/banners/domain/providers/banners_provider.dart';
import 'package:galaxy_18_lottery_app/features/banners/domain/repository/banners_repository.dart';
import 'package:galaxy_18_lottery_app/features/splash/presentation/providers/state/splash_notifier.dart';
import 'package:galaxy_18_lottery_app/features/splash/presentation/providers/state/splash_state.dart';
import 'package:galaxy_18_lottery_app/infrastructure/notification/firebase_notification.dart';
import 'package:galaxy_18_lottery_app/infrastructure/notification/providers/firebase_notification_provider.dart';
import 'package:galaxy_18_lottery_app/services/banners_cache_service/domain/providers/banners_cache_provider.dart';
import 'package:galaxy_18_lottery_app/services/banners_cache_service/domain/repository/banners_cache_repository.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/dio_nerwork_service_provider.dart';

final splashStateNotifierProvider =
    StateNotifierProvider<SplashNotifier, SplashAppState>((ref) {
  final AuthenticationRepository authenticationRepository =
      ref.watch(authRepositoryProvider);
  final UserRepository userRepository = ref.watch(userLocalRepositoryProvider);
  final FirebaseNotification firebaseNotification =
      ref.watch(firebaseNotificationProvider);
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final BannersRepository bannersRepository =
      ref.watch(bannersRepositoryProvider);
  final BannersCacheRepository bannersCacheRepository =
      ref.watch(bannersCacheRepositoryProvider);
  return SplashNotifier(
    firebaseService: firebaseNotification,
    userRepository: userRepository,
    authenticationRepository: authenticationRepository,
    networkService: networkService,
    bannersRepository: bannersRepository,
    bannersCacheRepository: bannersCacheRepository,
  );
});
