import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/data/datasource/current_draw_lottery_datasource.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/data/datasource/current_draw_lottery_remote_datasource.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/data/repository/current_draw_lottery_repository_impl.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/domain/repository/current_draw_lottery_repository.dart';
import 'package:galaxy_18_lottery_app/shared/data/remote/network_service.dart';
import 'package:galaxy_18_lottery_app/shared/domain/providers/dio_nerwork_service_provider.dart';

final currentDrawLotteryDatasourceProvider = Provider.family<CurrentDrawLotteryDatasource, NetworkService>((_, networkService) => CurrentDrawLotteryRemoteDatasource(networkService));

final currentDrawLotteryRepositoryProvider = Provider<CurrentDrawLotteryRepository>((ref){
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final CurrentDrawLotteryDatasource datasource = ref.watch(currentDrawLotteryDatasourceProvider(networkService));
  return CurrentDrawLotteryRepositoryImpl(datasource);
});