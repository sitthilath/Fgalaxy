import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/providers/user_cache_provider.dart';

final userLocalProvider = FutureProvider((ref) async {
  final repository = ref.watch(userLocalRepositoryProvider);
  final user = await repository.fetchUser();
  return user.fold((l) => null, (r) => r);
});