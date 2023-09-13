import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/providers/user_cache_provider.dart';

final currentUserProvider = FutureProvider((ref) async{
 final repository = ref.watch(userLocalRepositoryProvider);
 final eitherType = (await repository.fetchUser());
 return eitherType.fold((l) => null, (r) => r);
});