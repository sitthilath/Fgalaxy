import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/state/lotteries_treatise_notifier.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/state/lotteries_treatise_state.dart';
import 'package:galaxy_18_lottery_app/features/lotteries_treatise/domain/providers/lotteries_treatise_provider.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/domain/providers/lotteries_treatise_cache_provider.dart';

import '../../../../shared/domain/models/lotteries_treatise/lotteries_treatise_model.dart';

final lotteriesTreatiseNotifierProvider = StateNotifierProvider<LotteriesTreatiseNotifier, LotteriesTreatiseState>((ref){
  final cacheRepository = ref.watch(lotteriesTreatiseCacheRepositoryProvider);
  final repository = ref.watch(lotteriesTreatiseRepositoryProvider);
  return LotteriesTreatiseNotifier(repository: repository, cacheRepository: cacheRepository)..fetchAllLotteriesTreatise();
});

