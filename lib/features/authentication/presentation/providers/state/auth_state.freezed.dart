// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AuthState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$CodeSentCopyWith<$Res> {
  factory _$$CodeSentCopyWith(
          _$CodeSent value, $Res Function(_$CodeSent) then) =
      __$$CodeSentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CodeSentCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$CodeSent>
    implements _$$CodeSentCopyWith<$Res> {
  __$$CodeSentCopyWithImpl(_$CodeSent _value, $Res Function(_$CodeSent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CodeSent implements CodeSent {
  const _$CodeSent();

  @override
  String toString() {
    return 'AuthState.codeSent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CodeSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return codeSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return codeSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return codeSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return codeSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent(this);
    }
    return orElse();
  }
}

abstract class CodeSent implements AuthState {
  const factory CodeSent() = _$CodeSent;
}

/// @nodoc
abstract class _$$VerifyingCopyWith<$Res> {
  factory _$$VerifyingCopyWith(
          _$Verifying value, $Res Function(_$Verifying) then) =
      __$$VerifyingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Verifying>
    implements _$$VerifyingCopyWith<$Res> {
  __$$VerifyingCopyWithImpl(
      _$Verifying _value, $Res Function(_$Verifying) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Verifying implements Verifying {
  const _$Verifying();

  @override
  String toString() {
    return 'AuthState.verifying()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Verifying);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return verifying();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return verifying?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (verifying != null) {
      return verifying();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return verifying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return verifying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (verifying != null) {
      return verifying(this);
    }
    return orElse();
  }
}

abstract class Verifying implements AuthState {
  const factory Verifying() = _$Verifying;
}

/// @nodoc
abstract class _$$SigningCopyWith<$Res> {
  factory _$$SigningCopyWith(_$Signing value, $Res Function(_$Signing) then) =
      __$$SigningCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SigningCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Signing>
    implements _$$SigningCopyWith<$Res> {
  __$$SigningCopyWithImpl(_$Signing _value, $Res Function(_$Signing) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Signing implements Signing {
  const _$Signing();

  @override
  String toString() {
    return 'AuthState.signing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Signing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return signing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return signing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (signing != null) {
      return signing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return signing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return signing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (signing != null) {
      return signing(this);
    }
    return orElse();
  }
}

abstract class Signing implements AuthState {
  const factory Signing() = _$Signing;
}

/// @nodoc
abstract class _$$VerifiedCopyWith<$Res> {
  factory _$$VerifiedCopyWith(
          _$Verified value, $Res Function(_$Verified) then) =
      __$$VerifiedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifiedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Verified>
    implements _$$VerifiedCopyWith<$Res> {
  __$$VerifiedCopyWithImpl(_$Verified _value, $Res Function(_$Verified) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Verified implements Verified {
  const _$Verified();

  @override
  String toString() {
    return 'AuthState.verified()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Verified);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return verified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return verified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return verified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return verified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(this);
    }
    return orElse();
  }
}

abstract class Verified implements AuthState {
  const factory Verified() = _$Verified;
}

/// @nodoc
abstract class _$$ExceededCopyWith<$Res> {
  factory _$$ExceededCopyWith(
          _$Exceeded value, $Res Function(_$Exceeded) then) =
      __$$ExceededCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExceededCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Exceeded>
    implements _$$ExceededCopyWith<$Res> {
  __$$ExceededCopyWithImpl(_$Exceeded _value, $Res Function(_$Exceeded) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Exceeded implements Exceeded {
  const _$Exceeded();

  @override
  String toString() {
    return 'AuthState.exceeded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Exceeded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return exceeded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return exceeded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (exceeded != null) {
      return exceeded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return exceeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return exceeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (exceeded != null) {
      return exceeded(this);
    }
    return orElse();
  }
}

abstract class Exceeded implements AuthState {
  const factory Exceeded() = _$Exceeded;
}

/// @nodoc
abstract class _$$FailureCopyWith<$Res> {
  factory _$$FailureCopyWith(_$Failure value, $Res Function(_$Failure) then) =
      __$$FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException exception});
}

/// @nodoc
class __$$FailureCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Failure>
    implements _$$FailureCopyWith<$Res> {
  __$$FailureCopyWithImpl(_$Failure _value, $Res Function(_$Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$Failure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$Failure implements Failure {
  const _$Failure(this.exception);

  @override
  final AppException exception;

  @override
  String toString() {
    return 'AuthState.failure(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureCopyWith<_$Failure> get copyWith =>
      __$$FailureCopyWithImpl<_$Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements AuthState {
  const factory Failure(final AppException exception) = _$Failure;

  AppException get exception;
  @JsonKey(ignore: true)
  _$$FailureCopyWith<_$Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyByCodeCopyWith<$Res> {
  factory _$$VerifyByCodeCopyWith(
          _$VerifyByCode value, $Res Function(_$VerifyByCode) then) =
      __$$VerifyByCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyByCodeCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$VerifyByCode>
    implements _$$VerifyByCodeCopyWith<$Res> {
  __$$VerifyByCodeCopyWithImpl(
      _$VerifyByCode _value, $Res Function(_$VerifyByCode) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerifyByCode implements VerifyByCode {
  const _$VerifyByCode();

  @override
  String toString() {
    return 'AuthState.verifyByCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyByCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return verifyByCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return verifyByCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (verifyByCode != null) {
      return verifyByCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return verifyByCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return verifyByCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (verifyByCode != null) {
      return verifyByCode(this);
    }
    return orElse();
  }
}

abstract class VerifyByCode implements AuthState {
  const factory VerifyByCode() = _$VerifyByCode;
}

/// @nodoc
abstract class _$$AutoRetrievalTimeOutCopyWith<$Res> {
  factory _$$AutoRetrievalTimeOutCopyWith(_$AutoRetrievalTimeOut value,
          $Res Function(_$AutoRetrievalTimeOut) then) =
      __$$AutoRetrievalTimeOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AutoRetrievalTimeOutCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AutoRetrievalTimeOut>
    implements _$$AutoRetrievalTimeOutCopyWith<$Res> {
  __$$AutoRetrievalTimeOutCopyWithImpl(_$AutoRetrievalTimeOut _value,
      $Res Function(_$AutoRetrievalTimeOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AutoRetrievalTimeOut implements AutoRetrievalTimeOut {
  const _$AutoRetrievalTimeOut();

  @override
  String toString() {
    return 'AuthState.autoRetrievalTimeOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AutoRetrievalTimeOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return autoRetrievalTimeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return autoRetrievalTimeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (autoRetrievalTimeOut != null) {
      return autoRetrievalTimeOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return autoRetrievalTimeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return autoRetrievalTimeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (autoRetrievalTimeOut != null) {
      return autoRetrievalTimeOut(this);
    }
    return orElse();
  }
}

abstract class AutoRetrievalTimeOut implements AuthState {
  const factory AutoRetrievalTimeOut() = _$AutoRetrievalTimeOut;
}

/// @nodoc
abstract class _$$IdExistsCopyWith<$Res> {
  factory _$$IdExistsCopyWith(
          _$IdExists value, $Res Function(_$IdExists) then) =
      __$$IdExistsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdExistsCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$IdExists>
    implements _$$IdExistsCopyWith<$Res> {
  __$$IdExistsCopyWithImpl(_$IdExists _value, $Res Function(_$IdExists) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdExists implements IdExists {
  const _$IdExists();

  @override
  String toString() {
    return 'AuthState.idExists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdExists);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return idExists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return idExists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (idExists != null) {
      return idExists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return idExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return idExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (idExists != null) {
      return idExists(this);
    }
    return orElse();
  }
}

abstract class IdExists implements AuthState {
  const factory IdExists() = _$IdExists;
}

/// @nodoc
abstract class _$$IdNotExistsCopyWith<$Res> {
  factory _$$IdNotExistsCopyWith(
          _$IdNotExists value, $Res Function(_$IdNotExists) then) =
      __$$IdNotExistsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdNotExistsCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$IdNotExists>
    implements _$$IdNotExistsCopyWith<$Res> {
  __$$IdNotExistsCopyWithImpl(
      _$IdNotExists _value, $Res Function(_$IdNotExists) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdNotExists implements IdNotExists {
  const _$IdNotExists();

  @override
  String toString() {
    return 'AuthState.idNotExists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdNotExists);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return idNotExists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return idNotExists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (idNotExists != null) {
      return idNotExists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return idNotExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return idNotExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (idNotExists != null) {
      return idNotExists(this);
    }
    return orElse();
  }
}

abstract class IdNotExists implements AuthState {
  const factory IdNotExists() = _$IdNotExists;
}

/// @nodoc
abstract class _$$InvalidTokenCopyWith<$Res> {
  factory _$$InvalidTokenCopyWith(
          _$InvalidToken value, $Res Function(_$InvalidToken) then) =
      __$$InvalidTokenCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidTokenCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InvalidToken>
    implements _$$InvalidTokenCopyWith<$Res> {
  __$$InvalidTokenCopyWithImpl(
      _$InvalidToken _value, $Res Function(_$InvalidToken) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidToken implements InvalidToken {
  const _$InvalidToken();

  @override
  String toString() {
    return 'AuthState.invalidToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidToken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() codeSent,
    required TResult Function() verifying,
    required TResult Function() signing,
    required TResult Function() verified,
    required TResult Function() exceeded,
    required TResult Function(AppException exception) failure,
    required TResult Function() verifyByCode,
    required TResult Function() autoRetrievalTimeOut,
    required TResult Function() idExists,
    required TResult Function() idNotExists,
    required TResult Function() invalidToken,
  }) {
    return invalidToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? codeSent,
    TResult? Function()? verifying,
    TResult? Function()? signing,
    TResult? Function()? verified,
    TResult? Function()? exceeded,
    TResult? Function(AppException exception)? failure,
    TResult? Function()? verifyByCode,
    TResult? Function()? autoRetrievalTimeOut,
    TResult? Function()? idExists,
    TResult? Function()? idNotExists,
    TResult? Function()? invalidToken,
  }) {
    return invalidToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? codeSent,
    TResult Function()? verifying,
    TResult Function()? signing,
    TResult Function()? verified,
    TResult Function()? exceeded,
    TResult Function(AppException exception)? failure,
    TResult Function()? verifyByCode,
    TResult Function()? autoRetrievalTimeOut,
    TResult Function()? idExists,
    TResult Function()? idNotExists,
    TResult Function()? invalidToken,
    required TResult orElse(),
  }) {
    if (invalidToken != null) {
      return invalidToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(Verifying value) verifying,
    required TResult Function(Signing value) signing,
    required TResult Function(Verified value) verified,
    required TResult Function(Exceeded value) exceeded,
    required TResult Function(Failure value) failure,
    required TResult Function(VerifyByCode value) verifyByCode,
    required TResult Function(AutoRetrievalTimeOut value) autoRetrievalTimeOut,
    required TResult Function(IdExists value) idExists,
    required TResult Function(IdNotExists value) idNotExists,
    required TResult Function(InvalidToken value) invalidToken,
  }) {
    return invalidToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(Verifying value)? verifying,
    TResult? Function(Signing value)? signing,
    TResult? Function(Verified value)? verified,
    TResult? Function(Exceeded value)? exceeded,
    TResult? Function(Failure value)? failure,
    TResult? Function(VerifyByCode value)? verifyByCode,
    TResult? Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult? Function(IdExists value)? idExists,
    TResult? Function(IdNotExists value)? idNotExists,
    TResult? Function(InvalidToken value)? invalidToken,
  }) {
    return invalidToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(Verifying value)? verifying,
    TResult Function(Signing value)? signing,
    TResult Function(Verified value)? verified,
    TResult Function(Exceeded value)? exceeded,
    TResult Function(Failure value)? failure,
    TResult Function(VerifyByCode value)? verifyByCode,
    TResult Function(AutoRetrievalTimeOut value)? autoRetrievalTimeOut,
    TResult Function(IdExists value)? idExists,
    TResult Function(IdNotExists value)? idNotExists,
    TResult Function(InvalidToken value)? invalidToken,
    required TResult orElse(),
  }) {
    if (invalidToken != null) {
      return invalidToken(this);
    }
    return orElse();
  }
}

abstract class InvalidToken implements AuthState {
  const factory InvalidToken() = _$InvalidToken;
}
