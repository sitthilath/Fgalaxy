import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/information/domain/providers/information_provider.dart';
import 'package:galaxy_18_lottery_app/features/information/presentation/providers/state/information_notifier.dart';
import 'package:galaxy_18_lottery_app/features/information/presentation/providers/state/information_state.dart';

final informationNotifierProvider = StateNotifierProvider<InformationNotifier, InformationState>((ref){
  final repository = ref.watch(informationRepositoryProvider);
  return InformationNotifier(repository: repository)..fetchAllInformation();
});