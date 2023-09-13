import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:galaxy_18_lottery_app/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/shared/providers/dio_nerwork_service_provider.dart';
import 'package:galaxy_18_lottery_app/shared/remote/network_service.dart';

final authDataSourceProvider =
    Provider.family<LoginUserDataSource, NetworkService>(
        (_, networkService) => LoginUserRemoteDataSource(networkService));
final authRepositoryProvider = Provider<AuthenticationRepository>((ref){
 final NetworkService networkService = ref.watch(networkServiceProvider);
 final LoginUserDataSource loginUserDataSource = ref.watch(authDataSourceProvider(networkService));
 return AuthenticationRepositoryImpl(loginUserDataSource);
});
