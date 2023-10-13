import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/auth_providers.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/widgets/login_button.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/widgets/password_field.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/widgets/phone_field.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/constants/regex.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/label_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/loading.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => RegisterState();
}

class RegisterState extends ConsumerState<RegisterScreen> {
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
      if (next.state == AuthConcreteState.singingUp) {
        _showLoader(context, Txt.t(context, "waiting_msg"));
      } else if (next.state == AuthConcreteState.signedUp) {
        _closeLoader(context);
        AutoRouter.of(context).push(
          OTPRoute(phoneNumber: phoneController.text),
        );
      } else if (next.state == AuthConcreteState.failure) {
        if (next.statusCode == 409) {
          ref.read(toastMessageProvider).messageInfo(
              message:
                  "${Txt.t(context, "phone_number")} $LA_PREFIX${phoneController.text} ${Txt.t(context, "has_in_system_plz_login")}");
        } else if (next.statusCode == 422) {
          ref
              .read(authStateNotifierProvider.notifier)
              .sendOTP(phoneController.text);
          AutoRouter.of(context).push(
            OTPRoute(phoneNumber: phoneController.text),
          );
        } else {
          ref.read(toastMessageProvider).messageError(
                message: next.message.toString(),
              );
        }
        _closeLoader(context);
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
                          Txt.t(context, "register"),
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
                      heightBox(15),
                      registerButton(
                        onTab: () => _validateField(ref),
                      ),
                      Center(
                        child: labelText(
                            color: AppColor.blackColor,
                            text: Txt.t(context, "or"),
                            size: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      heightBox(15),
                      registerWithBCELOne(),
                      heightBox(20),
                      SizedBox(
                        width: double.infinity,
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Txt.t(context, "is_have_account"),
                              style:
                                  styleBlack(size: 14, weight: FontWeight.w600),
                            ),
                            widthBox(8),
                            InkWell(
                              onTap: () {
                                context.router.back();
                              },
                              child: Text(Txt.t(context, "login_button_text"),
                                  style: stylePrimary(
                                      size: 14, weight: FontWeight.w700)),
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

  _validateField(WidgetRef ref) async {
    focusDisable(context);
    _checkPhoneNumber(phoneController.text);
    _checkPassword(passwordController.text);
    if (phoneController.text.isNotEmpty &&
        phoneController.text.length == 8 &&
        passwordController.text.isNotEmpty &&
        passwordRegex.hasMatch(passwordController.text)) {
      ref
          .read(authStateNotifierProvider.notifier)
          .registerUser(phoneController.text, passwordController.text);
    }
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
    } else if (!passwordRegex.hasMatch(password)) {
      setState(() {
        passwordIsEmpty = Txt.t(context, "password_must_be_pass_regex");
      });
    } else {
      setState(() {
        passwordIsEmpty = null;
      });
    }
  }
}
