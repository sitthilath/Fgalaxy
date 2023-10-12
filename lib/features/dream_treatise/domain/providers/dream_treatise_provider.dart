import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/data/datasources/dream_treatise_datasource.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/data/datasources/dream_treatise_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/data/repository/dream_treatise_repository_impl.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/domain/repository/dream_treatise_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/dio_nerwork_service_provider.dart';

final dreamTreatiseDatasourceProvider =
    Provider.family<DreamTreatiseDatasource, NetworkService>(
        (_, networkService) => DreamTreatiseRemoteDatasource(networkService));

final dreamTreatiseRepositoryProvider =
    Provider<DreamTreatiseRepository>((ref) {
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final DreamTreatiseDatasource datasource =
      ref.watch(dreamTreatiseDatasourceProvider(networkService));
  return DreamTreatiseRepositoryImpl(datasource);
});
