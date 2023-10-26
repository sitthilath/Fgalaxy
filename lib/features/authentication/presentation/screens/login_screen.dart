import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/auth_providers.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/validate_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    ref.watch(authStateNotifierProvider);
    final String? phoneIsEmpty = ref.watch(checkPhoneNumberProvider);
    final String? passwordIsEmpty = ref.watch(checkPasswordProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    _listenAuthState(ref);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ThemeApp(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.loose,
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
                    right: 0,
                    left: 0,
                    bottom: -50,
                    child: Container(
                      width: screenWidth*0.7,
                      height: screenHeight*0.2,
                      alignment: Alignment.bottomCenter,
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
              flex: 3,
              child: Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(bottom: 6),
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
                      heightBox(10),
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
                      heightBox(10),
                      labelText(
                          color: AppColor.blackColor,
                          text: Txt.t(context, "password_text"),
                          size: 14,
                          fontWeight: FontWeight.w500),
                      heightBox(10),
                      passwordField(
                        controller: passwordController,
                        onValidate: (value) {
                          ref
                              .read(checkPasswordIsEmptyProvider.notifier)
                              .state = value;
                        },
                        errorMsg: passwordIsEmpty != null
                            ? Txt.t(context, passwordIsEmpty)
                            : null,
                      ),
                      heightBox(8.0),
                      InkWell(
                        onTap: () => AutoRouter.of(context)
                            .push(const ForgotPasswordRoute()),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            Txt.t(context, "forgot_password_text"),
                            style: stylePrimary(
                                size: 14, weight: FontWeight.w400),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      heightBox(10),
                      loginButton(onTab: _onLoginUser),
                      Center(
                        child: labelText(
                            color: AppColor.blackColor,
                            text: Txt.t(context, "or"),
                            size: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      loginWithOTP(_loginWithOTP,
                          fontColor: AppColor.primaryColor),
                      heightBox(10),
                      loginWithBCELOne(),
                      heightBox(10),
                      SizedBox(
                        width: double.infinity,
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Txt.t(context, 'not_have_account'),
                              style: styleBlack(
                                  size: 14, weight: FontWeight.w600),
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

  _onLoginUser() async {
    focusDisable(context);
    ref.read(checkPhoneNumberIsEmptyProvider.notifier).state =
        phoneController.text;
    ref.read(checkPasswordIsEmptyProvider.notifier).state =
        passwordController.text;
    if (phoneController.text.isNotEmpty &&
        phoneController.text.length == 10 &&
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
    AutoRouter.of(context).push(const LoginWithOTP());
  }

  void _listenAuthState(WidgetRef ref) {
    ref.listen(authStateNotifierProvider.select((value) => value),
        (previous, next) async {
      if (next.state == AuthConcreteState.signingIn) {
        await _showLoader(context, Txt.t(context, "waiting_msg"));
      } else if (next.state == AuthConcreteState.signedIn) {
        _closeLoader(context);
        AutoRouter.of(context)
            .pushAndPopUntil(NavigatorRoute(), predicate: (_) => false);
        _clearTextController();
      } else if (next.state == AuthConcreteState.failure) {
        _closeLoader(context);
        if (next.statusCode != 409) {
          ref
              .read(toastMessageProvider)
              .messageError(message: next.message.toString());
        }
      }
    });
  }
}
