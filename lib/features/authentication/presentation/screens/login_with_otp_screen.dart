import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/auth_providers.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/validate_provider.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/widgets/login_button.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/widgets/phone_field.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/services/loader_service/providers/loader_provider.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/label_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class LoginWithOTP extends ConsumerStatefulWidget {
  static const String routeName = '/loginWithOTP';

  const LoginWithOTP({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginWithOTP> createState() => _LoginWithOTPState();
}

class _LoginWithOTPState extends ConsumerState<LoginWithOTP> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String? phoneIsEmpty = ref.watch(checkPhoneNumberProvider);
    ref.watch(loginWithOtpStateNotifierProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    ref.read(loaderProvider).context = context;
    _listenState();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ThemeApp(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppConstants.authBGImagePath),
                          fit: BoxFit.cover),
                    ),
                    child: Image.asset(
                      AppConstants.appLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -50,
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: SvgPicture.asset(
                        AppConstants.boxGroupPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(bottom: 15, top: 15),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              color: AppColor.borderColor,
                            )),
                          ),
                          child: Text(
                            Txt.t(context, "login_with_otp"),
                            style: stylePrimary(
                              size: 18,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                        heightBox(15),
                        labelText(
                            color: AppColor.blackColor,
                            text: Txt.t(context, "phone_number"),
                            size: 14,
                            fontWeight: FontWeight.w500),
                        heightBox(10),
                        phoneField(
                          controller: phoneController,
                          onValidate: (value) {
                            ref
                                .read(checkPhoneNumberIsEmptyProvider.notifier)
                                .state = value;
                          },
                          errorMsg: phoneIsEmpty != null
                              ? Txt.t(context, phoneIsEmpty)
                              : null,
                        ),
                        heightBox(20),
                        loginWithOTP(_loginWithOTP,
                            bgColor: AppColor.primaryColor,
                            fontColor: AppColor.whiteColor),
                        heightBox(15),
                        heightBox(20),
                        SizedBox(
                          width: double.infinity,
                          child: Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Txt.t(context, 'is_have_account'),
                                style: styleBlack(
                                    size: 14, weight: FontWeight.w600),
                              ),
                              widthBox(8),
                              InkWell(
                                onTap: () {
                                  context.router.push(const LoginRoute());
                                },
                                child: Text(
                                  Txt.t(context, "login_button_text"),
                                  style: stylePrimary(
                                      size: 14, weight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loginWithOTP() {
    focusDisable(context);
    ref.read(checkPhoneNumberIsEmptyProvider.notifier).state =
        phoneController.text;
    if (phoneController.text.isNotEmpty && phoneController.text.length == 10) {
      ref
          .read(loginWithOtpStateNotifierProvider.notifier)
          .loginWithOtp(phoneController.text);
    }
  }

  void _listenState() {
    ref.listen(loginWithOtpStateNotifierProvider.select((value) => value),
        (previous, next) async {
      if (next.state == AuthConcreteState.signingWithOtp) {
        ref.read(loaderProvider).showLoader(Txt.t(context, "waiting_msg"));
      } else if (next.state == AuthConcreteState.signedWithOtp) {
        ref.read(loaderProvider).closeLoader();
        AutoRouter.of(context)
            .push(OTPRoute(phoneNumber: phoneController.text, isLogin: true));
      } else if (next.state == AuthConcreteState.failure) {
        ref.read(toastMessageProvider).messageError(message: next.message);
      }
    });
  }
}
