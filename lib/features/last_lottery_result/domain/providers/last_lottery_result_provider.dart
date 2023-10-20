import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/data/datasource/last_lottery_result_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/data/repository/last_lottery_result_repository_impl.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/domain/repository/last_lottery_result_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/dio_nerwork_service_provider.dart';

final lastLotteryResultDatasourceProvider = Provider.family<LastLotteryResultDatasource, NetworkService>((_, networkService) => LastLotteryResultRemoteDatasource(networkService));
final lastLotteryResultRepositoryProvider = Provider<LastLotteryResultRepository>((ref){
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final LastLotteryResultDatasource datasource = ref.watch(lastLotteryResultDatasourceProvider(networkService));
  return LastLotteryResultRepositoryImpl(datasource);
});