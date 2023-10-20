import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/domain/providers/current_draw_lottery_provider.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/domain/repository/current_draw_lottery_repository.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/presentation/providers/state/current_draw_lottery_notifier.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/presentation/providers/state/current_draw_lottery_state.dart';
import 'package:galaxy_18_lottery_app/services/current_draw_lottery_cache_service/domain/providers/current_draw_lottery_cache_provider.dart';
import 'package:galaxy_18_lottery_app/services/current_draw_lottery_cache_service/domain/repository/current_draw_lottery_cache_repository.dart';

final currentDrawLotteryStateNotifierProvider = StateNotifierProvider<CurrentDrawLotteryNotifier, CurrentDrawLotteryState>((ref){
  final CurrentDrawLotteryRepository repository = ref.watch(currentDrawLotteryRepositoryProvider);
  final CurrentDrawLotteryCacheRepository cacheRepository = ref.watch(currentDrawLotteryCacheRepoProvider);
  return CurrentDrawLotteryNotifier(repository: repository, cacheRepository: cacheRepository)..getCurrentDrawLotto();
});