import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/lotteries_treatise/data/datasource/lotteries_treatise_datasource.dart';
import 'package:galaxy_18_lottery_app/features/lotteries_treatise/data/datasource/lotteries_treatise_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/lotteries_treatise/data/repository/lotteries_treatise_repository_impl.dart';
import 'package:galaxy_18_lottery_app/features/lotteries_treatise/domain/repository/lottery_treatise_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/dio_nerwork_service_provider.dart';

final lotteriesTreatiseDatasourceProvider = Provider.family<LotteriesTreatiseDatasource, NetworkService>((_, networkService) => LotteriesTreatiseRemoteDatasource(networkService));
final lotteriesTreatiseRepositoryProvider = Provider<LotteriesTreatiseRepository>((ref){
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final LotteriesTreatiseDatasource datasource = ref.watch(lotteriesTreatiseDatasourceProvider(networkService));
  return LotteriesTreatiseRepositoryImpl(datasource);
});