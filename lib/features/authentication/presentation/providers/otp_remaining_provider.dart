import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';

final otpRemainingProvider = StateProvider<int>((ref) => TIMER_OF_OTP);