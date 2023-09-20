import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/configs/app_configs.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_form.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_model.dart' as user;
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthNotifier({required this.authRepository, required this.userRepository})
      : super(const AuthState.initial());

  late UserForm _userForm = const UserForm(phoneNumber: '', password: '');

  String _verificationId = '';
  int resendToken = -1;
  String currentPhoneNumber = '';
  int _currentAttempt = 0;
  final int _maxAttempts = 5;
  final int throttleHours = 4;

  bool get isThrottled => _currentAttempt == _maxAttempts;
  bool _isSignUp = true;
  bool _isSignInWithOTP = false;

  bool _isThrottledUserAttempts(bool isResend, String phoneNumber) {
    if (isResend) {
      if (_currentAttempt == _maxAttempts) return true;
      _currentAttempt = _currentAttempt + 1;
    } else if (currentPhoneNumber != phoneNumber) {
      _currentAttempt = 0;
      currentPhoneNumber = phoneNumber;
    }
    return false;
  }

  Future<void> loginUser(String username, String password) async {
    state = const AuthState.signing();
    final response = await authRepository.loginUser(
        user: user.User(username: username, password: password));
    state = await response.fold((failure) => AuthState.failure(failure),
        (user) async {
      final hasSaveUser = await userRepository.saveUser(user: user);
      print(" =======>$hasSaveUser");
      if (hasSaveUser) {
        return const AuthState.verified();
      }
      return AuthState.failure(CacheFailureException());
    });
  }

  Future<void> verifyPhoneNumber(UserForm userForm,
      {bool isResend = false,
      bool isSignUp = true,
      bool isSignInWithOTP = false}) async {
    state = const AuthState.initial();
    state = const AuthState.verifying();
    if (_isThrottledUserAttempts(isResend, userForm.phoneNumber)) {
      return Future.value(null);
    }
    _isSignUp = isSignUp;
    _isSignInWithOTP = isSignInWithOTP;
    _userForm = userForm;
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "${AppConfigs.LA_PREFIX}${userForm.phoneNumber}",
        timeout: const Duration(seconds: 100),
        forceResendingToken: (isResend? resendToken: null),
        verificationCompleted: _verificationComplete,
        verificationFailed: _verificationFailed,
        codeSent: _smsCodeSent,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
  }

  void _smsCodeSent(String verificationId, [int? forceResendingToken]) {
    _verificationId = verificationId;
    resendToken = forceResendingToken ?? -1;
    state = const AuthState.codeSent();
  }

  void _verificationComplete(PhoneAuthCredential phoneAuthCredential) async {
    try{
      state = const AuthState.verifying();
      await _authenticateUser(phoneAuthCredential);
    } on PlatformException catch(e) {
      state = AuthState.failure(AppException(message: "Verify Phone Error Code: ${e.code}"
          "\nVerify Phone Message: ${e.message}", statusCode: 0, identifier: '_verificationComplete'));
    }
  }

 Future<void> _authenticateUser(AuthCredential authCredential) async {
    try{
      UserCredential authResult = await _firebaseAuth.signInWithCredential(authCredential);
      authResult.user?.getIdToken().then((idToken) async {
        debugPrint(idToken, wrapWidth: 1024);

        if(!_isSignUp){
          return const AuthState.verified();
        }
        if(_isSignInWithOTP){
          await loginUser(_userForm.phoneNumber, _userForm.password);
        }
        state = const AuthState.signing();
        final response = await authRepository.registerUser(userForm: _userForm);
        return response.fold((l) => Left(l), (r){
         return const AuthState.verified();
        });
      });
    } catch(e){
      print("AuthFirebaseCredential: $e");
    }
    return Future.value(null);
  }

  void _verificationFailed(FirebaseAuthException ex) {
    switch(ex.code){
      case 'too-many-requests':
      case 'quotaExceeded':
        const AuthState.exceeded();
        break;
      default: 
        AuthState.failure(AppException(message: 'Phone Verification Failed: Code: ${ex.code}\nMessage: ${ex.message}', statusCode: 0, identifier: '_verificationFailed'));
    }
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    _verificationId = verificationId;
    const AuthState.autoRetrievalTimeOut();
  }

  void verifyUserByCode(String verifyCode) async {
    state = const AuthState.verifying();
    final AuthCredential authCredential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: verifyCode);

    try{
      await _authenticateUser(authCredential);
    } on PlatformException catch (e) {
      state = const AuthState.verifyByCode();
    }
  }
}
