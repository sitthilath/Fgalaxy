import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/auth_providers.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/widgets/login_button.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/widgets/password_field.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/widgets/phone_field.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/label_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/loading.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/loginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => LoginState();
}

class LoginState extends ConsumerState<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? phoneIsEmpty;
  String? passwordIsEmpty;

  @override
  Widget build(BuildContext context) {
    ref.watch(authStateNotifierProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    ref.listen(authStateNotifierProvider.select((value) => value),
        (previous, next) async {
      if (next.state == AuthConcreteState.signingIn) {
        await _showLoader(context, Txt.t(context, "waiting_msg"));
      } else if (next.state == AuthConcreteState.signedIn) {
        _closeLoader(context);
        AutoRouter.of(context).pushAndPopUntil(NavigatorRoute(), predicate: (_) => false);
        _clearTextController();
      } else if (next.state == AuthConcreteState.failure) {
        _closeLoader(context);
        if (next.statusCode != 409) {
          ref.read(toastMessageProvider).messageError(message: next.message.toString());
        }
      }else if(next.state == AuthConcreteState.signingWithOtp){
        await _showLoader(context, Txt.t(context, "waiting_msg"));
      }else if(next.state == AuthConcreteState.signedWithOtp){
        _closeLoader(context);
        AutoRouter.of(context).push(OTPRoute(phoneNumber: phoneController.text, isLogin: true));
      }
    });
    return Scaffold(
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
                          Txt.t(context, "login_button_text"),
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
                      heightBox(15),
                      labelText(
                          color: AppColor.blackColor,
                          text: Txt.t(context, "password_text"),
                          size: 14,
                          fontWeight: FontWeight.w500),
                      heightBox(10),
                      passwordField(
                        controller: passwordController,
                        onValidate: _checkPassword,
                        errorMsg: passwordIsEmpty,
                      ),
                      heightBox(8.0),
                      InkWell(
                        onTap: () => AutoRouter.of(context).push(const ForgotPasswordRoute()),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            Txt.t(context, "forgot_password_text"),
                            style: stylePrimary(size: 14, weight: FontWeight.w400),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      heightBox(15),
                      loginButton(onTab: _onLoginUser),
                      Center(
                        child: labelText(
                            color: AppColor.blackColor,
                            text: Txt.t(context, "or"),
                            size: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      loginWithOTP(_loginWithOTP),
                      heightBox(15),
                      loginWithBCELOne(),
                      heightBox(20),
                      SizedBox(
                        width: double.infinity,
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Txt.t(context, 'not_have_account'),
                              style:
                                  styleBlack(size: 14, weight: FontWeight.w600),
                            ),
                            widthBox(8),
                            InkWell(
                              onTap: () {
                                context.router.push(const RegisterRoute());
                              },
                              child: Text(
                                Txt.t(context, "register"),
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

  void _checkPassword(String password) {
    if (password.isEmpty) {
      setState(() {
        passwordIsEmpty = Txt.t(context, "password_can_not_be_empty");
      });
    } else {
      setState(() {
        passwordIsEmpty = null;
      });
    }
  }

  _onLoginUser() async {
    focusDisable(context);
    _checkPhoneNumber(phoneController.text);
    _checkPassword(passwordController.text);
    if (phoneController.text.isNotEmpty &&
        phoneController.text.length == 8 &&
        passwordController.text.isNotEmpty) {
      ref
          .read(authStateNotifierProvider.notifier)
          .loginUser(phoneController.text, passwordController.text);
    }
  }

  void _clearTextController() {
    setState(() {
      phoneController.text = '';
      passwordController.text = '';
    });
  }

  Future<void> _showLoader(BuildContext context, String title) {
    return LoadingDialog.showAuthLoadingDialog(context, title: title);
  }

  Future<void> _closeLoader(BuildContext context) async {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      return navigator.pop();
    }
    return Future.value(null);
  }

  _loginWithOTP() {
    focusDisable(context);
    _checkPhoneNumber(phoneController.text);
    if(phoneController.text.isNotEmpty && phoneController.text.length == 8){
      ref.read(authStateNotifierProvider.notifier).loginWithOtp(phoneController.text);
    }
  }
}
