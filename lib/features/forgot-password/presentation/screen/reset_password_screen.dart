import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/reset_password_state_notifier.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/state/forgot_password_state.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/time_remaining.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/validate_provider.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/widgets/otp_field.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/widgets/password_field.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/services/loader_service/providers/loader_provider.dart';
import 'package:galaxy_18_lottery_app/shared/constants/regex.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/shared_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/label_widget.dart';

@RoutePage()
class ResetPasswordScreen extends ConsumerStatefulWidget {
  static const String routeName = '/resetPasswordScreen';

  const ResetPasswordScreen(this.phoneNumber, {super.key});

  final String phoneNumber;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ResetPasswordState();
}

class ResetPasswordState extends ConsumerState<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordCtr = TextEditingController();
  final TextEditingController _otpCtr = TextEditingController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _otpCounter();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _otpCounter() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (ref.watch(timeRemainingProvider) > 0) {
        ref.read(timeRemainingProvider.notifier).update((state) => state - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(resetPasswordStateNotifierProvider);
    final String? passwordIsEmpty = ref.watch(checkPasswordProvider);
    final String? cfPasswordIsEmpty = ref.watch(checkCfPasswordProvider);
    final String? otpIsEmpty = ref.watch(checkOtpProvider);
    final int timeRemaining = ref.watch(timeRemainingProvider);
    ref.read(loaderProvider).context = context;
    _listenState(ref);
    return Scaffold(
      appBar: SharedAppbar(
          title: Txt.t(context, 'change_password_title'),
          color: AppColor.primaryColor),
      bottomSheet: _verifyButton(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            labelText(
                color: AppColor.blackColor,
                text: Txt.t(context, "new_password"),
                fontWeight: FontWeight.w400),
            heightBox(10),
            PasswordField(
              controller: _passwordController,
              onChange: (value) {
                ref.read(passwordProvider.notifier).state = value;
              },
              errorMsg: passwordIsEmpty != null
                  ? Txt.t(context, passwordIsEmpty)
                  : null,
            ),
            heightBox(15),
            labelText(
              color: AppColor.blackColor,
              text: Txt.t(context, "confirm_password"),
              fontWeight: FontWeight.w400,
            ),
            heightBox(10),
            PasswordField(
              controller: _confirmPasswordCtr,
              onChange: (value) {
                ref.read(cfPasswordProvider.notifier).state = value;
              },
              errorMsg: cfPasswordIsEmpty != null
                  ? Txt.t(context, cfPasswordIsEmpty)
                  : null,
            ),
            heightBox(15),
            labelText(
              color: AppColor.blackColor,
              text: Txt.t(context, "confirm_otp"),
              fontWeight: FontWeight.w400,
            ),
            heightBox(10),
            OTPField(
              controller: _otpCtr,
              onChange: (value) {
                ref.read(otpProvider.notifier).state = value;
              },
              errorMsg: otpIsEmpty != null ? Txt.t(context, otpIsEmpty) : null,
            ),
            heightBox(10),
            timeRemaining == 0
                ? _resendOTP(timeRemaining)
                : _waitOTP(timeRemaining),
          ],
        ),
      ),
    );
  }

  _verifyButton() {
    return InkWell(
      onTap: () async {
        focusDisable(context);
        ref.read(passwordProvider.notifier).state = _passwordController.text;
        ref.read(cfPasswordProvider.notifier).state = _confirmPasswordCtr.text;
        ref.read(otpProvider.notifier).state = _otpCtr.text;
        if (_passwordController.text.isNotEmpty &&
            passwordRegex.hasMatch(_passwordController.text) &&
            _otpCtr.text.isNotEmpty &&
            _otpCtr.text.length == 6) {
          _timer.cancel();
          await ref
              .read(resetPasswordStateNotifierProvider.notifier)
              .resetPassword(
                widget.phoneNumber,
                _otpCtr.text,
                _passwordController.text,
              );
        }
      },
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(Txt.t(context, "change_password_button"),
            style: styleWhite(size: 14, weight: FontWeight.w400)),
      ),
    );
  }

  _sendOtpAgain(int timeRemaining) {
    if (timeRemaining == 0) {
      ref
          .read(resetPasswordStateNotifierProvider.notifier)
          .resendOTP(widget.phoneNumber);
      ref.read(timeRemainingProvider.notifier).state = TIMER_OF_OTP;
    }
  }

  _waitOTP(int timeRemaining) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        heightBox(10),
        Text(
          Txt.t(context, 'otp_can_send_again_at'),
          style: styleOption(
            color: AppColor.blackColor,
            size: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        widthBox(3),
        Text(
          '$timeRemaining ${Txt.t(context, 'second')}',
          style: styleOption(
            color: AppColor.blackColor,
            size: 14,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  _resendOTP(int timeRemaining) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          Txt.t(context, 'still_haven_received_the_code'),
          style: styleOption(
            color: AppColor.blackColor,
            size: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        widthBox(3),
        InkWell(
            onTap: () {
              _sendOtpAgain(timeRemaining);
            },
            child: Text(
              Txt.t(context, 'send_again'),
              style: stylePrimary(
                size: 14,
                weight: FontWeight.w400,
              ),
            ))
      ],
    );
  }

  void _listenState(WidgetRef ref) {
    ref.listen(resetPasswordStateNotifierProvider.select((value) => value),
        (previous, next) {
         if(next is Loading){
           ref.read(loaderProvider).showLoader(Txt.t(context, 'waiting_msg'));
         }else if(next is Success){
           ref.read(loaderProvider).closeLoader();
           ref.read(toastMessageProvider).messageSuccess(
               message: Txt.t(context, 'change_password_success_msg'));
           AutoRouter.of(context)
               .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
         }else if(next is Failure){
           ref.read(loaderProvider).closeLoader();
           ref
               .read(toastMessageProvider)
               .messageError(message: next.exception.message.toString());
         }else{
           ref.read(loaderProvider).closeLoader();
         }
        });
  }
}
