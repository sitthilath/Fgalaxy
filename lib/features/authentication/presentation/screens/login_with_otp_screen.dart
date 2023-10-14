import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/auth_providers.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_state.dart';
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
  String? phoneIsEmpty;
  @override
  Widget build(BuildContext context) {
    ref.watch(authStateNotifierProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    ref.read(loaderProvider).context = context;
    _listenState();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ThemeApp(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 280,
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
              top: 180,
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: SvgPicture.asset(
                  AppConstants.boxGroupPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 280,
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
                child: IntrinsicHeight(
                  child: ListView(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(bottom: 15),
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
                        onValidate: _checkPhoneNumber,
                        errorMsg: phoneIsEmpty,
                      ),
                      heightBox(20),
                      loginWithOTP(_loginWithOTP, bgColor: AppColor.primaryColor, fontColor: AppColor.whiteColor),
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
                              style:
                              styleBlack(size: 14, weight: FontWeight.w600),
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
          ],
        ),
      ),
    );
  }

  void _checkPhoneNumber(String phone) {
    if (phone.isEmpty) {
      setState(() {
        phoneIsEmpty = Txt.t(context, "phone_can_not_empty");
      });
    } else if (phone.length < 8) {
      setState(() {
        phoneIsEmpty = Txt.t(context, "phone_should_be_must_equal_8");
      });
    } else {
      setState(() {
        phoneIsEmpty = null;
      });
    }
  }

  _loginWithOTP() {
    focusDisable(context);
    _checkPhoneNumber(phoneController.text);
    if(phoneController.text.isNotEmpty && phoneController.text.length == 8){
      ref.read(authStateNotifierProvider.notifier).loginWithOtp(phoneController.text);
    }
  }

  void _listenState() {
    ref.listen(authStateNotifierProvider.select((value) => value), (previous, next) async {
      if(next.state == AuthConcreteState.signingWithOtp){
      ref.read(loaderProvider).showLoader(Txt.t(context, "waiting_msg"));
      }else if(next.state == AuthConcreteState.signedWithOtp){
      ref.read(loaderProvider).closeLoader();
      AutoRouter.of(context).push(OTPRoute(phoneNumber: phoneController.text, isLogin: true));
      }else if( next.state == AuthConcreteState.failure){
        ref.read(toastMessageProvider).messageError(message: next.message);
      }
    });
  }
}
