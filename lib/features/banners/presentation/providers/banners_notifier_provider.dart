import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/banners/domain/providers/banners_provider.dart';
import 'package:galaxy_18_lottery_app/features/banners/domain/repository/banners_repository.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/providers/state/banner_notifier.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/providers/state/banner_state.dart';

final bannersNotifierProvider = StateNotifierProvider<BannerNotifier, BannerState>((ref){
  final BannersRepository repository = ref.watch(bannersRepositoryProvider);
  return BannerNotifier(repository: repository);
});