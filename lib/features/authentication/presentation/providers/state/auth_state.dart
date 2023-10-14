import 'package:equatable/equatable.dart';

enum AuthConcreteState {
  initial,
  signingIn,
  signedIn,
  failure,
  singingUp,
  signedUp,
  sendingOtp,
  sentOtp,
  verifying,
  verified,
  signingWithOtp,
  signedWithOtp,
  verifyingWithOtp,
  verifiedWithOtp,
  signingOut,
  signedOut,
}

class AuthState extends Equatable {
  final AuthConcreteState state;
  final String message;
  final bool isLoading;
  final int statusCode;

  const AuthState({
    this.state = AuthConcreteState.initial,
    this.message = '',
    this.isLoading = false,
    this.statusCode =0,
  });

  @override
  List<Object?> get props => [state, message];

  const AuthState.initial({
    this.state = AuthConcreteState.initial,
    this.message = '',
    this.isLoading = false,
    this.statusCode = 0,
  });

  AuthState copyWith({
    AuthConcreteState? state,
    String? message,
    bool? isLoading,
    int? statusCode,
  }) {
    return AuthState(
      state: state ?? this.state,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  @override
  String toString() {
    return 'AuthState(state: $state, message: $message, isLoading: $isLoading, statusCode: $statusCode)';
  }
}
