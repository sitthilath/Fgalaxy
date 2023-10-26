import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/auth_providers.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/otp_remaining_provider.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/services/loader_service/providers/loader_provider.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/shared_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/input_decoration.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class OTPScreen extends ConsumerStatefulWidget {
  const OTPScreen({super.key, required this.phoneNumber, this.isLogin = false});

  final String phoneNumber;
  final bool isLogin;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => OTPScreenState();
}

class OTPScreenState extends ConsumerState<OTPScreen> {
   Timer? _timer;
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (ref.watch(otpRemainingProvider) > 0) {
        ref.read(otpRemainingProvider.notifier).update((state) => state - 1);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int otpRemaining = ref.watch(otpRemainingProvider);
    ref.watch(otpStateNotifierProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    ref.read(loaderProvider).context = context;
    _listenState();
    return ThemeApp(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: SharedAppbar(title: Txt.t(context, "confirm_otp")),
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(Txt.t(context, "your_phone_send_to"),
                  style: styleWhite(size: 14, weight: FontWeight.w400)),
              heightBox(6),
              Text(LA_PREFIX + widget.phoneNumber,
                  style: styleWhite(size: 14, weight: FontWeight.w400)),
              heightBox(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: simpleDecoration(hint: 'xxxxxx'),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onTapOutside: (event) {
                    focusDisable(context);
                  },
                  onChanged: _onSubmitOtp,
                  onSubmitted: _onSubmitOtp,
                ),
              ),
              heightBox(20),
              otpRemaining == 0
                  ? _sendOtpAgain(otpRemaining)
                  : Text(
                      "${Txt.t(context, "otp_can_send_again_at")} ${ref.watch(otpRemainingProvider)} ${Txt.t(context, "second")}",
                      style: styleWhite(size: 14, weight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sendOtpAgain(int otpRemaining) {
    return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Txt.t(context, "still_haven_received_the_code"),
              style: styleWhite(size: 14, weight: FontWeight.w300)),
          widthBox(10),
          InkWell(
            onTap: () {
              ref
                  .read(otpStateNotifierProvider.notifier)
                  .sendOTP(widget.phoneNumber);
              ref.read(otpRemainingProvider.notifier).state = TIMER_OF_OTP;
            },
            child: Text(Txt.t(context, "send_again"),
                style: styleWhite(size: 14, weight: FontWeight.w600)),
          ),
        ]);
  }

  Future<void> _showLoader(String title) async {
     ref.read(loaderProvider).showLoader(title);
  }

  Future<void> _closeLoader() async {
     ref.read(loaderProvider).closeLoader();
  }

  void _listenState() {
    ref.listen(otpStateNotifierProvider.select((value) => value),
        (previous, next) async {
      switch(next.state){
        case AuthConcreteState.sendingOtp:
          _showLoader(Txt.t(context, "verify_msg"));
          break;
        case AuthConcreteState.sentOtp:
          _closeLoader();
          _startCountdown();
          break;
        case AuthConcreteState.verifying:
          _showLoader(Txt.t(context, "verify_msg"));
          break;
        case AuthConcreteState.verified:
          _closeLoader();
          ref.read(toastMessageProvider).messageSuccess(message: Txt.t(context, "register_success"));
          AutoRouter.of(context).pushAndPopUntil(NavigatorRoute(), predicate: (_) => false);
          break;
        case AuthConcreteState.verifyingWithOtp:
           _showLoader(Txt.t(context, "verify_msg"));
          break;
        case AuthConcreteState.verifiedWithOtp:
          _closeLoader();
          ref.read(toastMessageProvider).messageSuccess(message: Txt.t(context, "register_success"));
          AutoRouter.of(context).pushAndPopUntil(NavigatorRoute(), predicate: (_) => false);
          break;
        case AuthConcreteState.failure:
           _closeLoader();
          ref.read(toastMessageProvider).messageError(message: next.message.toString());
          ref.read(otpRemainingProvider.notifier).state = 0;
           _timer?.cancel();
          break;
        default:
          _closeLoader();
      }
    });
  }

  void _onSubmitOtp(String otp) {
    if (otp.isNotEmpty && otp.length == 6) {
      if (widget.isLogin) {
        ref.read(otpStateNotifierProvider.notifier).verifyUserWithOTP(widget.phoneNumber, otp);
        return;
      }
      ref.read(otpStateNotifierProvider.notifier).verifyUser(otp, widget.phoneNumber);
    }
  }
}
