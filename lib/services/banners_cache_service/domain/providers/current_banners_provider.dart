import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/services/banners_cache_service/domain/providers/banners_cache_provider.dart';

final currentBannersProvider = FutureProvider((ref) async {
  final repository = ref.watch(bannersCacheRepositoryProvider);
  final eitherType = (await repository.fetchAllBannersCache());
  return eitherType.fold((l) => null, (r) => r);
});