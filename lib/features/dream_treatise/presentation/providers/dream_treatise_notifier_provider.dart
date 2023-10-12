import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/domain/providers/dream_treatise_provider.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/domain/repository/dream_treatise_repository.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/providers/state/dream_treatise_notifier.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/providers/state/dream_treatise_state.dart';

final dreamTreatiseNotifierProvider = StateNotifierProvider<DreamTreatiseNotifier, DreamTreatiseState>((ref){
  final DreamTreatiseRepository repository = ref.watch(dreamTreatiseRepositoryProvider);
  return DreamTreatiseNotifier(repository);
});