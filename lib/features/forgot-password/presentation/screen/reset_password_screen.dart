import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/forgot_password_notifier_provider.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/widgets/otp_field.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/widgets/password_field.dart';
import 'package:galaxy_18_lottery_app/shared/constants/regex.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/shared_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/label_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

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
  // final TextEditingController _confirmPasswordCtr = TextEditingController();
  final TextEditingController _otpCtr = TextEditingController();
  String? passwordIsEmpty;
  String? passwordMatch;
  String? otpIsEmpty;
  int _secondsRemaining = TIMER_OF_OTP;
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
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   ref.watch(forgotPasswordStateNotifierProvider);
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
              onChange: _checkPassword,
              errorMsg: passwordIsEmpty,
            ),
            // heightBox(15),
            // labelText(
            //   color: AppColor.blackColor,
            //   text: Txt.t(context, "confirm_password"),
            //   fontWeight: FontWeight.w400,
            // ),
            // heightBox(10),
            // PasswordField(
            //   controller: _confirmPasswordCtr,
            //   onChange: _checkCfPassword,
            //   errorMsg: passwordMatch,
            // ),
            heightBox(15),
            labelText(
              color: AppColor.blackColor,
              text: Txt.t(context, "confirm_otp"),
              fontWeight: FontWeight.w400,
            ),
            heightBox(10),
            OTPField(
              controller: _otpCtr,
              onChange: _checkOtp,
              errorMsg: otpIsEmpty,
              timer: _secondsRemaining,
              sendAgain: _sendOtpAgain,
            ),
          ],
        ),
      ),
    );
  }

  _checkPassword(String password) {
    if (password.isEmpty) {
      setState(() {
        passwordIsEmpty = Txt.t(context, 'password_can_not_be_empty');
      });
    } else if (!passwordRegex.hasMatch(password)) {
      setState(() {
        passwordIsEmpty = Txt.t(context, 'password_must_be_pass_regex');
      });
    } else {
      setState(() {
        passwordIsEmpty = null;
      });
    }
  }

  _checkCfPassword(String cfPassword) {
    if (cfPassword != _passwordController.text) {
      setState(() {
        passwordMatch = Txt.t(context, 'password_not_match');
      });
    } else {
      setState(() {
        passwordMatch = null;
      });
    }
  }

  _checkOtp(String otp) {
    if (otp.isEmpty) {
      setState(() {
        otpIsEmpty = Txt.t(context, 'otp_can_not_empty');
      });
    } else if (otp.length < 6) {
      setState(() {
        otpIsEmpty = Txt.t(context, 'otp_should_be_6');
      });
    } else {
      setState(() {
        otpIsEmpty = null;
      });
    }
  }

  _verifyButton() {
    return InkWell(
      onTap: () async {
        focusDisable(context);
        _checkPassword(_passwordController.text);
        // _checkCfPassword(_confirmPasswordCtr.text);
        if (_passwordController.text.isNotEmpty &&
            passwordRegex.hasMatch(_passwordController.text) &&
            _otpCtr.text.isNotEmpty &&
            _otpCtr.text.length == 6) {
          _timer.cancel();
          await ref
              .read(forgotPasswordStateNotifierProvider.notifier)
              .resetPassword(
                  widget.phoneNumber, _otpCtr.text, _passwordController.text);
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

  _sendOtpAgain() {
    if (_secondsRemaining == 0) {
      ref.read(forgotPasswordStateNotifierProvider.notifier).forgotPassword(widget.phoneNumber);
    }
    setState(() {
      _secondsRemaining = TIMER_OF_OTP;
    });
  }
}
