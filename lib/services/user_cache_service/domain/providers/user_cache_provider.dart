import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/data/datasource/user_local_datasource.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/data/repositories/user_cache_repository_impl.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/local/storage_service.dart';
import 'package:galaxy_18_lottery_app/shared/providers/sharedpreferance_storage_service.dart';

final userDataSourceProvider = Provider.family<UserDataSource, StorageService>(
    (_, networkService) => UserLocalDataSource(networkService));
final userLocalRepositoryProvider = Provider<UserRepository>((ref) {
  final StorageService storageService = ref.watch(storageServiceProvider);
  final datasource = ref.watch(userDataSourceProvider(storageService));
  final repository = UserRepositoryImpl(datasource);
  return repository;
});
