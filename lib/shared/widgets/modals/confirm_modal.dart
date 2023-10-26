import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

Future showLogoutConfirmModal(BuildContext context,
    {required String title, required String content}) async {
  final result = await showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0.0,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Text(
                Txt.t(context, title),
                style: styleBlack(size: 18, weight: FontWeight.w600),
                maxLines: 1,
              ),
              heightBox(20),
              Text(
                Txt.t(context, content),
                style: styleBlack(size: 14, weight: FontWeight.w400),
              ),
              heightBox(20),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: Text(
                      Txt.t(context, 'cancel_text'),
                      style: styleOption(
                          color: AppColor.fontGrayColor,
                          fontWeight: FontWeight.w500,
                          size: 14),
                    ),
                    onPressed: () => Navigator.of(context).pop('no'),
                  ),
                  TextButton(
                    child: Text(
                      Txt.t(context, 'logout'),
                      style: styleOption(
                          color: AppColor.errorColor,
                          size: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () => Navigator.of(context).pop('ok'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
  return result;
}

Future showInfoModal(BuildContext context, {required String content}) async {
  final result = await showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0.0,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            children: [
              SvgPicture.asset(
                AppConstants.closeOutline,
                width: 40,
                height: 40,
                color: AppColor.errorColor,
              ),
              heightBox(20),
              Text(
                content,
                style: styleBlack(size: 14, weight: FontWeight.w400),
              ),
              heightBox(20),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop('ok');
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      )),
                  child: Text(
                    Txt.t(context, 'ok'),
                    style: styleWhite(size: 14, weight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  return result;
}
