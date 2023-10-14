import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:galaxy_18_lottery_app/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_form.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;

  AuthNotifier({required this.authRepository, required this.userRepository})
      : super(const AuthState.initial());

  Future<void> registerUser(String phone, String password) async {
    state = state.copyWith(
      state: AuthConcreteState.singingUp,
      isLoading: true,
    );
    final response = await authRepository.registerUser(
        userForm: UserForm(phoneNumber: LA_PREFIX + phone, password: password));
        await response.fold((failure){
          state = state.copyWith(
            state: AuthConcreteState.failure,
            message: failure.message,
            isLoading: false,
            statusCode: failure.statusCode,
          );
        }, (data) async {
      if (data.isNotEmpty) {
        state = state.copyWith(
          state: AuthConcreteState.signedUp,
          isLoading: false,
          statusCode: 200,
        );
      }else {
        state = state.copyWith(
          state: AuthConcreteState.failure,
          message: CacheFailureException().message,
          isLoading: false,
          statusCode: 0,
        );
      }
    });
  }

  Future<void> sendOTP(String phone) async {
    state = state.copyWith(
      state: AuthConcreteState.sendingOtp,
      isLoading: true,
    );
    final responseCode = await authRepository.sendOTP(
        phone: UserForm(phoneNumber: LA_PREFIX + phone));
    responseCode.fold((failure) {
      state = state.copyWith(
        state: AuthConcreteState.failure,
        message: failure.message,
        isLoading: false,
        statusCode: failure.statusCode,
      );
    }, (data) {
      if (data.isNotEmpty) {
        state = state.copyWith(
          state: AuthConcreteState.sentOtp,
          isLoading: false,
          statusCode: 200,
        );
      } else {
        state = state.copyWith(
          message: 'ການຂໍລະຫັດ OTP ຫຼົ່ມເຫຼວ',
          state: AuthConcreteState.failure,
          isLoading: false,
        );
      }
    });
  }
      Future<void> verifyUser(String code, String phone) async {
        state = state.copyWith(
          state: AuthConcreteState.verifying,
          isLoading: true,
        );
        final response = await authRepository.verifyOTP(
            code: UserForm(otpCode: code, phoneNumber: LA_PREFIX + phone));
        await response.fold((failure) {
          state = state.copyWith(
            state: AuthConcreteState.failure,
            message: failure.message,
            isLoading: false,
            statusCode: failure.statusCode,
          );
        },
                (user) async {
              final hasSaveUser = await userRepository.saveUser(user: user);
              if (hasSaveUser) {
                state = state.copyWith(
                  state: AuthConcreteState.verified,
                  isLoading: false,
                  statusCode: 200,
                );
              } else {
                state = state.copyWith(
                  state: AuthConcreteState.failure,
                  isLoading: false,
                  message: CacheFailureException().message,
                );
              }
            });
      }

      Future<void> loginUser(String phone, String password) async {
        state = state.copyWith(
          state: AuthConcreteState.signingIn,
          isLoading: true,
        );
        final response = await authRepository.loginUser(
            userForm: UserForm(
                phoneNumber: LA_PREFIX + phone, password: password));
        response.fold((failure) {
          state = state.copyWith(
            state: AuthConcreteState.failure,
            message: failure.message,
            isLoading: false,
            statusCode: failure.statusCode,
          );
        },
                (user) async {
              final hasSaveUser = await userRepository.saveUser(user: user);
              if (hasSaveUser) {
                state = state.copyWith(
                  state: AuthConcreteState.signedIn,
                  isLoading: false,
                  statusCode: 200,
                );
              } else {
                state.copyWith(
                  state: AuthConcreteState.failure,
                  message: CacheFailureException().message,
                  isLoading: false,
                );
              }
            });
      }

      Future<void> loginWithOtp(String phone) async {
       state = state.copyWith(
         state: AuthConcreteState.signingWithOtp,
         isLoading: true,
       );

       final response = await authRepository.loginWithOTP(phone: UserForm(phoneNumber: LA_PREFIX + phone));
       response.fold((failure){
         state = state.copyWith(
           state: AuthConcreteState.failure,
           statusCode: failure.statusCode,
           message: failure.message,
           isLoading: false,
         );
       }, (data){
         if(data.isNotEmpty){
           state = state.copyWith(
             state: AuthConcreteState.signedWithOtp,
             statusCode: 200,
             isLoading: false,
           );
         }
       });
      }

      Future<void> verifyUserWithOTP(String phone, String code) async {
        state = state.copyWith(
          state: AuthConcreteState.verifyingWithOtp,
          isLoading: true,
        );

        final response = await authRepository.verifyLoginWithOTP(form: UserForm(otpCode: code, phoneNumber: LA_PREFIX+phone));
        response.fold((failure){
          state = state.copyWith(
            state: AuthConcreteState.failure,
            isLoading: false,
            message: failure.message,
            statusCode: failure.statusCode,
          );
        }, (data) async {
          final hasSaveUser = await userRepository.saveUser(user: data);
          if(hasSaveUser){
            state = state.copyWith(
              state: AuthConcreteState.verifiedWithOtp,
              isLoading: false,
              statusCode: 200,
            );
          }else{
            state = state.copyWith(
              state: AuthConcreteState.failure,
              isLoading: false,
              message: CacheFailureException().message,
            );
          }
        });
      }
      Future<void> logoutUser() async {
        state = state.copyWith(
          state: AuthConcreteState.signingOut,
          isLoading: true,
        );

        final response = await authRepository.logout();
        response.fold((failure){
          state = state.copyWith(
            state: AuthConcreteState.failure,
            message: failure.message,
            statusCode: failure.statusCode,
            isLoading: false,
          );
        }, (data) async{
         final isRemoved =  await userRepository.removeUser();
         if(isRemoved){
           state = state.copyWith(
             state: AuthConcreteState.signedOut,
             isLoading: false,
           );
         }else{
           state = state.copyWith(
             state: AuthConcreteState.failure,
             isLoading: false,
             message: CacheFailureException().message,
           );
         }
        });
      }

      void resetState(){
       state = const AuthState.initial();
      }
    }
