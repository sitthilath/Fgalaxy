import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/configs/app_configs.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/auth_providers.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/shared_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/loading.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class OTPScreen extends ConsumerStatefulWidget {
  const OTPScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => OTPScreenState();
}

class OTPScreenState extends ConsumerState<OTPScreen> {
  List<int> otpCodes = [];
  int _secondsRemaining = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authStateNotifierProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    ref.listen(authStateNotifierProvider.select((value) => value),
        (previous, next) async {
      if (next is Verifying) {
        _showLoader(context, "Verifying");
      } else if (next is Verified) {
        await _closeLoader(context);
        ref
            .read(toastMessageProvider)
            .messageSuccess(message: 'ລົງທະບຽນສຳເລັດ ກຳລັງເຂົ້າສູ່ລະບົບ');
        otpCodes.clear();
      } else if (next is Failure) {
        await _closeLoader(context);
        ref
            .read(toastMessageProvider)
            .messageError(message: next.exception.message.toString());
        otpCodes.clear();
      }
    });
    return ThemeApp(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const SharedAppbar(title: 'ຢືນຢັນລະຫັດ OTP'),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                  child: SizedBox(
                width: double.infinity,
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    Text("ລະຫັດ OTP ຂອງທ່ານຖືກສົ່ງໄປຫາເບີ",
                        style: styleWhite(size: 14, weight: FontWeight.w400)),
                    Text(AppConfigs.LA_PREFIX + widget.phoneNumber,
                        style: styleWhite(size: 14, weight: FontWeight.w400)),
                    heightBox(36),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _pinItems(_checkIndex(0)),
                        widthBox(12),
                        _pinItems(_checkIndex(1)),
                        widthBox(12),
                        _pinItems(_checkIndex(2)),
                        widthBox(12),
                        _pinItems(_checkIndex(3)),
                        widthBox(12),
                        _pinItems(_checkIndex(4)),
                        widthBox(12),
                        _pinItems(_checkIndex(5)),
                      ],
                    ),
                    heightBox(36),
                    _sendOtpAgain(),
                  ],
                ),
              )),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: AppColor.whiteColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _digit(
                              number: 1,
                              subText: '',
                              onTap: () => _addNumber(1)),
                          _digit(
                              number: 2,
                              subText: 'a b c',
                              onTap: () => _addNumber(2)),
                          _digit(
                              number: 3,
                              subText: 'd e f',
                              onTap: () => _addNumber(3)),
                        ],
                      ),
                      heightBox(15),
                      Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _digit(
                              number: 4,
                              subText: 'g h i',
                              onTap: () => _addNumber(4)),
                          _digit(
                              number: 5,
                              subText: 'j l k',
                              onTap: () => _addNumber(5)),
                          _digit(
                              number: 6,
                              subText: 'm n o',
                              onTap: () => _addNumber(6)),
                        ],
                      ),
                      heightBox(15),
                      Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _digit(
                              number: 7,
                              subText: 'p q r s',
                              onTap: () => _addNumber(7)),
                          _digit(
                              number: 8,
                              subText: 't u v',
                              onTap: () => _addNumber(8)),
                          _digit(
                              number: 9,
                              subText: 'w x y z',
                              onTap: () => _addNumber(9)),
                        ],
                      ),
                      heightBox(15),
                      Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _digit(number: '*', subText: '', onTap: () {}),
                          _digit(
                              number: 0,
                              subText: '+',
                              onTap: () => _addNumber(0)),
                          _digit(number: '#', subText: '', onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _sendOtpAgain() {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _secondsRemaining == 0
          ? [
              Text("ຍັງບໍ່ໄດ້ຮັບລະຫັດ",
                  style: styleWhite(size: 14, weight: FontWeight.w300)),
              widthBox(10),
              InkWell(
                onTap: () {
                  if (_secondsRemaining == 0) {
                    ref
                        .read(authStateNotifierProvider.notifier)
                        .sendOTP(widget.phoneNumber);
                    setState(() {
                      _secondsRemaining = 30;
                    });
                    _startCountdown();
                  }
                },
                child: Text("ຂໍລະຫັດອີກຄັ້ງ",
                    style: styleWhite(size: 14, weight: FontWeight.w600)),
              ),
            ]
          : [
              Text("ລະຫັດ OTP ສາມາດຂໍໄດ້ອີກໃນ $_secondsRemaining ວິນາທີ",
                  style: styleWhite(size: 14, weight: FontWeight.w400)),
            ],
    );
  }

  Container _pinItems(bool isFill) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: isFill ? AppColor.whiteColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColor.whiteColor,
          )),
    );
  }

  _digit(
      {required dynamic number,
      required String subText,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 50,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "$number",
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    fontFamily: 'roboto',
                    inherit: false,
                    color: AppColor.blackColor),
              ),
              Text(
                subText.toUpperCase(),
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    height: 0,
                    color: AppColor.blackColor),
              ),
            ],
          )),
    );
  }

  bool _checkIndex(int index) {
    bool hasIndex = false;
    if (otpCodes.isNotEmpty) {
      if (otpCodes.length > index) {
        hasIndex = otpCodes.elementAt(index) != -1;
      } else {
        hasIndex = false;
      }
    }
    return hasIndex;
  }

  void _addNumber(int i) {
    if (otpCodes.length <= 5) {
      setState(() {
        otpCodes.add(i);
      });
    }
    if (otpCodes.length == 6) {
      final code = otpCodes.join('');
      ref
          .read(authStateNotifierProvider.notifier)
          .verifyUser(code,widget.phoneNumber);
    }
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
