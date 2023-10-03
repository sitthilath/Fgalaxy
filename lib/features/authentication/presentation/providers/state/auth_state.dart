import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial; // initial state
  const factory AuthState.signing() = Signing; // ກຳລັງລົງທະບຽນ ຫຼື ເຂົ້າສູ່ລະບົບ
  const factory AuthState.signed() = Signed; // ລົງທະບຽນ ຫຼື ເຊົ້າສູ່ລະບົບ ສຳເລັດ
  const factory AuthState.signingCode() = SigningCode; // ກຳລັງສົ່ງລະຫັດ otp
  const factory AuthState.signedCode() = SignedCode; // send otp code success
  const factory AuthState.verifying() = Verifying; // ກວດສອບລະຫັດ otp// signing in or signing up
  const factory AuthState.verified() = Verified; // success login or register
  const factory AuthState.failure(AppException exception) = Failure; // unknown error
  const factory AuthState.verifyByCode() = VerifyByCode; // verify code error
  const factory AuthState.idExists() = IdExists; // phone already exists
  const factory AuthState.idNotExists() = IdNotExists; // user is not register
  const factory AuthState.invalidToken() = InvalidToken; // Token ບໍ່ຖືກຕ້ອງ
}