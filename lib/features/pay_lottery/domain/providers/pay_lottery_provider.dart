

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/pay_lottery/data/datasource/pay_lottery_remote_data_source.dart';
import 'package:galaxy_18_lottery_app/features/pay_lottery/domain/repositories/pay_lottery_repository.dart';

import '../../../../shared/data/remote/network_service.dart';
import '../../../../shared/domain/providers/dio_nerwork_service_provider.dart';
import '../../data/repositories/pay_lottery_repository_impl.dart';

final payLotteryDataSourceProvider =
Provider.family<PayLotteryDataSource, NetworkService>(
        (_, networkService) => PayLotteryRemoteDataSource(networkService));
final payLotteryRepositoryProvider = Provider<PayLotteryRepository>((ref){
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final PayLotteryDataSource payLotteryDataSource = ref.watch(payLotteryDataSourceProvider(networkService));
  return PayLotteryRepositoryImpl(payLotteryDataSource);
});
