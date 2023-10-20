import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/domain/providers/last_lottery_result_provider.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/domain/repository/last_lottery_result_repository.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/presentation/providers/state/last_lottery_result_notifier.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/presentation/providers/state/last_lottery_result_state.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/domain/providers/lotteries_treatise_cache_provider.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/domain/repository/lotteries_treatise_cache_repository.dart';

final lastLotteryResultStateNotifierProvider = StateNotifierProvider<LastLotteryResultNotifier, LastLotteryResultState>((ref){
  final LastLotteryResultRepository repository = ref.watch(lastLotteryResultRepositoryProvider);
  final LotteriesTreatiseCacheRepository cacheRepository = ref.watch(lotteriesTreatiseCacheRepositoryProvider);
  return LastLotteryResultNotifier(repository: repository, cacheRepository: cacheRepository)..getLastLotteryResult();
});