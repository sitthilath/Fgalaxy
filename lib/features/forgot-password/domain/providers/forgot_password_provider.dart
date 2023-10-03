import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/data/datasource/forgot_password_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/data/repository/forgot_password_repository_impl.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/domain/repository/forgot_password_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/dio_nerwork_service_provider.dart';

final forgotPasswordDatasourceProvider = Provider.family<ForgotPasswordDatasource, NetworkService>((_, networkService) => ForgotPasswordRemoteDatasource(networkService));

final forgotPasswordRepositoryProvider = Provider<ForgotPasswordRepository>((ref){
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final ForgotPasswordDatasource forgotPasswordDatasource = ref.watch(forgotPasswordDatasourceProvider(networkService));
  return ForgotPasswordRepositoryImpl(forgotPasswordDatasource);
});