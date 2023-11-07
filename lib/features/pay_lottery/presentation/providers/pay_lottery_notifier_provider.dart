
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/pay_lottery/domain/repositories/pay_lottery_repository.dart';
import 'package:galaxy_18_lottery_app/features/pay_lottery/presentation/providers/state/pay_lottery_notifier.dart';
import 'package:galaxy_18_lottery_app/features/pay_lottery/presentation/providers/state/pay_lottery_state.dart';
import '../../domain/providers/pay_lottery_provider.dart';

final payLotteryNotifierProvider =
StateNotifierProvider<PayLotteryNotifier, PayLotteryState>((ref) {
  final PayLotteryRepository payLotteryRepository = ref.watch(payLotteryRepositoryProvider);
  return PayLotteryNotifier(payLotteryRepository: payLotteryRepository);
});