import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/constants/regex.dart';

final checkPhoneNumberIsEmptyProvider = StateProvider<String?>((ref) => null);
final checkPasswordIsEmptyProvider = StateProvider<String?>((ref) => null);

final checkPhoneNumberProvider = Provider<String?>((ref) {
  final String? phone = ref.watch(checkPhoneNumberIsEmptyProvider);
  if(phone != null){
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

final checkPasswordProvider = Provider<String?>((ref){
  final String? password = ref.watch(checkPasswordIsEmptyProvider);
  if(password != null){
    if(password.isEmpty){
      return "password_can_not_be_empty";
    }
    return null;
  }
  return null;
});

final checkPasswordWhenUserRegisterProvider = Provider<String?>((ref){
  final String? password = ref.watch(checkPasswordIsEmptyProvider);
  if(password != null){
    if(password.isEmpty){
      return "password_can_not_be_empty";
    }else if(!passwordRegex.hasMatch(password)){
      return "password_must_be_pass_regex";
    }
      return null;
  }
  return null;
});
