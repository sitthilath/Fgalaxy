import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/state/random_lottery_notifier.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/state/random_lottery_state.dart';

final randomLotteryStateNotifierProvider = StateNotifierProvider<RandomLotteryNotifier, RandomLotteryState>((ref){
  return RandomLotteryNotifier();
});