import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/information/data/datasource/information_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/information/data/repository/information_repository_impl.dart';
import 'package:galaxy_18_lottery_app/features/information/domain/repository/information_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/dio_nerwork_service_provider.dart';

final informationDatasourceProvider = Provider.family<InformationDatasource, NetworkService>((_, networkService) => InformationRemoteDatasource(networkService));

final informationRepositoryProvider = Provider<InformationRepository>((ref){
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final InformationDatasource datasource = ref.watch(informationDatasourceProvider(networkService));
  return InformationRepositoryImpl(datasource);
});