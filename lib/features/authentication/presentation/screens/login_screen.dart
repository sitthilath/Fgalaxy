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
    ref.listen(authStateNotifierProvider.select((value) => value), (previous,
        next) async {
      if (next is Signing) {
        await _showLoader(context, "ກະລຸນາລໍຖ້າ");
      } else if (next is Signed) {
        _closeLoader(context);
        AutoRouter.of(context).pushAndPopUntil(NavigatorRoute(), predicate: (_) => false);
        _clearTextController();
      } else if (next is Failure) {
        _closeLoader(context);
        if (next.exception.statusCode != 409) {
          ref.read(toastMessageProvider).messageError(
              message: next.exception.message.toString());
        }
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
                          "ເຂົ້າສູ່ລະບົບ",
                          style: stylePrimary(
                            size: 18,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ),
                      heightBox(15),
                      labelText(
                          color: AppColor.blackColor,
                          text: 'ເບີໂທລະສັບ',
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
                          text: 'ລະຫັດຜ່ານ',
                          size: 14,
                          fontWeight: FontWeight.w500),
                      heightBox(10),
                      passwordField(
                        controller: passwordController,
                        onValidate: _checkPassword,
                        errorMsg: passwordIsEmpty,
                      ),
                      heightBox(15),
                      loginButton(onTab: _onLoginUser),
                      Center(
                        child: labelText(
                            color: AppColor.blackColor,
                            text: 'ຫຼື',
                            size: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      loginWithOTP(),
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
                              "ຍັງບໍ່ມີບັນຊີເທື່ອ",
                              style:
                              styleBlack(size: 14, weight: FontWeight.w600),
                            ),
                            widthBox(8),
                            InkWell(
                              onTap: () {
                                context.router.push(RegisterRoute());
                              },
                              child: Text(
                                "ລົງທະບຽນ",
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
        phoneIsEmpty = "ເບີໂທລະສັບບໍ່ສາມາດວ່າງເປົ່າໄດ້";
      });
    } else if (phone.length < 8) {
      setState(() {
        phoneIsEmpty = "ເບີໂທລະສັບຈະຕ້ອງເທົ່າ 8 ຕົວເລກ";
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
        passwordIsEmpty = "ລະຫັດຜ່ານບໍ່ສາມາດວ່າງເປົ່າໄດ້";
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
}
