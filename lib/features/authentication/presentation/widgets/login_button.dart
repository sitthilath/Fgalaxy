import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/hex_color.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';

Widget loginButton({required Function()onTab}){
  return InkWell(
    onTap: onTab,
    child: Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.04, -1.00),
          end: const Alignment(0.03, 1),
          colors: [HexColor('#06A8DF'), HexColor('#143ED3')],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Text('ເຂົ້າສູ່ລະບົບ', style: styleWhite(size: 14, weight: FontWeight.w600)),
    ),
  );
}

Widget loginWithOTP(Function() onTap, {Color bgColor = Colors.transparent, Color fontColor = Colors.blue}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          color: AppColor.primaryColor,
          width: 1.5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Text('ເຂົ້າສູ່ລະບົບຜ່ານ OTP', style: styleOption(size: 14, fontWeight: FontWeight.w800, color: fontColor)),
    ),
  );
}

Widget loginWithBCELOne(){
  return InkWell(
    child: Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.bcelOneColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Text('ເຂົ້າສູ່ລະບົບດ້ວຍ BCEL One', style: styleWhite(size: 14, weight: FontWeight.w600)),
    ),
  );
}
Widget registerButton({required Function ()onTab}){
  return InkWell(
    onTap: onTab,
    child: Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.04, -1.00),
          end: const Alignment(0.03, 1),
          colors: [HexColor('#06A8DF'), HexColor('#143ED3')],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Text('ລົງທະບຽນ', style: styleWhite(size: 14, weight: FontWeight.w600)),
    ),
  );
}
Widget registerWithBCELOne(){
  return InkWell(
    child: Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.bcelOneColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Text('ລົງທະບຽນດ້ວຍ BCEL One', style: styleWhite(size: 14, weight: FontWeight.w600)),
    ),
  );
}