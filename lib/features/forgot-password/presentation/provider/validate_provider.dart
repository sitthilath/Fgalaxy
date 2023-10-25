import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/constants/regex.dart';

final checkPhoneNumberIsEmptyProvider = StateProvider<String?>((ref) => null);
final checkPhoneNumberProvider = Provider<String?>((ref) {
  final String? phone = ref.watch(checkPhoneNumberIsEmptyProvider);
  if (phone != null) {
    if (phone.isEmpty) {
      return "phone_can_not_empty";
    } else if (phone.length < 10) {
      return "phone_should_be_must_equal_10";
    } else if (!mobilePhoneNumberRegex.hasMatch(phone)) {
      return "mobile_should_be_must_20_8numbers";
    } else {
      return null;
    }
  }
  return null;
});

final passwordProvider = StateProvider<String?>((ref) => null);
final checkPasswordProvider = Provider<String?>((ref) {
  final String? password = ref.watch(passwordProvider);
  if (password != null) {
    if (password.isEmpty) {
      return 'password_can_not_be_empty';
    } else if (!passwordRegex.hasMatch(password)) {
      return 'password_must_be_pass_regex';
    } else {
      return null;
    }
  }
  return null;
});
final cfPasswordProvider = StateProvider<String?>((ref) => null);
final checkCfPasswordProvider = Provider<String?>((ref) {
  final String? password = ref.watch(passwordProvider);
  final String? cfPassword = ref.watch(cfPasswordProvider);
  if (password != null && cfPassword != null) {
    if (cfPassword != password) {
      return 'password_not_match';
    } else {
      return null;
    }
  }
  return null;
});
final otpProvider = StateProvider<String?>((ref) => null);
final checkOtpProvider = Provider<String?>((ref) {
  final String? otp = ref.watch(otpProvider);
  if (otp != null) {
    if (otp.isEmpty) {
      return 'otp_can_not_empty';
    } else if (otp.length < 6) {
      return 'otp_should_be_6';
    } else {
      return null;
    }
  }
  return null;
});
