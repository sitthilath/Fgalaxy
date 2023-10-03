import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/domain/providers/forgot_password_provider.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/domain/repository/forgot_password_repository.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/state/forgot_password_notifier.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/state/forgot_password_state.dart';

final forgotPasswordStateNotifierProvider = StateNotifierProvider<ForgotPasswordStateNotifier, ForgotPasswordState>((ref){
  final ForgotPasswordRepository forgotPasswordRepository = ref.watch(forgotPasswordRepositoryProvider);
  return ForgotPasswordStateNotifier(forgotPasswordRepository: forgotPasswordRepository);
});