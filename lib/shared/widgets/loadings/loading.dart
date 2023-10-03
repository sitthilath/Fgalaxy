import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

class LoadingDialog {
  static Future<void> showAuthLoadingDialog(BuildContext context,
      {required String title}) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              backgroundColor: AppColor.whiteColor,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 6,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColor.primaryColor),
                      ),
                      heightBox(10),
                      Text(
                        title,
                        style: stylePrimary(size: 14, weight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
