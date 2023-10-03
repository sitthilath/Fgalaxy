import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/message_service.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/toasts/toast_body_widget.dart';

class FlutterToastMessage implements MessageService {
  late FToast _fToast;

  @override
  Future<void> messageError({required String message, int duration = 3}) {
    _fToast.showToast(
      child: toastMessage(
        message,
        bgColor: AppColor.errorColor,
        fontColor: AppColor.whiteColor,
      ),
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: duration),
    );
    return Future.delayed(const Duration(milliseconds: 200), () {});
  }

  @override
  Future<void> messageInfo({required String message, int duration = 3}) {
    _fToast.showToast(
      child: toastMessage(
        message,
        bgColor: AppColor.primaryColor,
        fontColor: AppColor.whiteColor,
      ),
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: duration),
    );
    return Future.delayed(const Duration(milliseconds: 200), () {});
  }

  @override
  Future<void> messageSuccess({required String message, int duration = 3}) {
    _fToast.showToast(
      child: toastMessage(
        message,
        bgColor: AppColor.successColor,
        fontColor: AppColor.whiteColor,
      ),
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: duration),
    );
    return Future.delayed(const Duration(milliseconds: 200), () {});
  }

  @override
  Future<void> initialMessage(BuildContext context) {
    _fToast = FToast();
    _fToast.init(context);
    return Future.value(null);
  }
}
