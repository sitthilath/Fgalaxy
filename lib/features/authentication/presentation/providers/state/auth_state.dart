import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
part 'auth_state.freezed.dart';
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial; // initial state
  const factory AuthState.codeSent() = CodeSent; // ສົ່ງລະຫັດ otp ສຳເລັດ
  const factory AuthState.verifying() = Verifying; // ກວດສອບລະຫັດ otp
  const factory AuthState.signing() = Signing; // signing in or signing up
  const factory AuthState.verified() = Verified; // success login or register
  const factory AuthState.exceeded() = Exceeded; // over time submit request from firebase
  const factory AuthState.failure(AppException exception) = Failure; // unknown error
  const factory AuthState.verifyByCode() = VerifyByCode; // verify code error
  const factory AuthState.autoRetrievalTimeOut() = AutoRetrievalTimeOut; // time out
  const factory AuthState.idExists() = IdExists; // phone already exists
  const factory AuthState.idNotExists() = IdNotExists; // user is not register
  const factory AuthState.invalidToken() = InvalidToken; // Token ບໍ່ຖືກຕ້ອງ
}